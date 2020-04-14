; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 -mtriple=thumbv8.1m.main-arm-none-eabi --verify-machineinstrs -mattr=+mve.fp %s -o - | FileCheck %s

declare <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32>, <4 x i32>, <4 x i1>, <4 x i32>)

define arm_aapcs_vfpcc <4 x i32> @vpt_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpt_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpt.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <4 x i32> @vptt_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptt_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov q3, q0
; CHECK-NEXT:    vptt.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q3, q1, q2
; CHECK-NEXT:    vorrt q0, q3, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %1, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <4 x i32> @vpttt_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpttt_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpttt.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %1)
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %2)
  ret <4 x i32> %3
}

define arm_aapcs_vfpcc <4 x i32> @vptttt_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptttt_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vptttt.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %1)
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %2)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %3)
  ret <4 x i32> %4
}


define arm_aapcs_vfpcc <4 x i32> @vpte_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpte_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpte.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  ret <4 x i32> %3
}

define arm_aapcs_vfpcc <4 x i32> @vptte_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptte_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vptte.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorre q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %2 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %2)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %1, <4 x i32> %3)
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <4 x i32> @vptee_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptee_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vptee.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vorre q0, q1, q2
; CHECK-NEXT:    vorre q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %2 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %1, <4 x i32> %2)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %1, <4 x i32> %3)
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <4 x i32> @vptet_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptet_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #4
; CHECK-NEXT:    sub sp, #4
; CHECK-NEXT:    vcmp.s32 ge, q0, q2
; CHECK-NEXT:    vstr p0, [sp] @ 4-byte Spill
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpnot
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    add sp, #4
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %3)
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <4 x i32> @vpttet_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpttet_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #4
; CHECK-NEXT:    sub sp, #4
; CHECK-NEXT:    vcmp.s32 ge, q0, q2
; CHECK-NEXT:    vstr p0, [sp] @ 4-byte Spill
; CHECK-NEXT:    vpstt
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpnot
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    add sp, #4
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vptett_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptett_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #4
; CHECK-NEXT:    sub sp, #4
; CHECK-NEXT:    vcmp.s32 ge, q0, q2
; CHECK-NEXT:    vstr p0, [sp] @ 4-byte Spill
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpnot
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpstt
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    add sp, #4
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vpteet_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpteet_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #8
; CHECK-NEXT:    sub sp, #8
; CHECK-NEXT:    vcmp.s32 ge, q0, q2
; CHECK-NEXT:    vstr p0, [sp] @ 4-byte Spill
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpnot
; CHECK-NEXT:    vstr p0, [sp, #4] @ 4-byte Spill
; CHECK-NEXT:    vldr p0, [sp, #4] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp, #4] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    add sp, #8
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vpteee_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpteee_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpteee.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vptete_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vptete_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .pad #8
; CHECK-NEXT:    sub sp, #8
; CHECK-NEXT:    vcmp.s32 ge, q0, q2
; CHECK-NEXT:    vstr p0, [sp] @ 4-byte Spill
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpnot
; CHECK-NEXT:    vstr p0, [sp, #4] @ 4-byte Spill
; CHECK-NEXT:    vldr p0, [sp, #4] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vldr p0, [sp, #4] @ 4-byte Reload
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    add sp, #8
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vpttte_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpttte_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpttte.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %4)
  ret <4 x i32> %5
}

define arm_aapcs_vfpcc <4 x i32> @vpttee_block(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: vpttee_block:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vpttee.s32 ge, q0, q2
; CHECK-NEXT:    vorrt q0, q1, q2
; CHECK-NEXT:    vmovt q0, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    vmove q0, q2
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp sge <4 x i32> %a, %c
  %1 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %b, <4 x i32> %c, <4 x i1> %0, <4 x i32> %a)
  %2 = xor <4 x i1> %0, <i1 true, i1 true, i1 true, i1 true>
  %3 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %0, <4 x i32> %1)
  %4 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %3)
  %5 = tail call <4 x i32> @llvm.arm.mve.orr.predicated.v4i32.v4i1(<4 x i32> %c, <4 x i32> %c, <4 x i1> %2, <4 x i32> %4)
  ret <4 x i32> %5
}