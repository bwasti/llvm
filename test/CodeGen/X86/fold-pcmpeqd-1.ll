; RUN: llc < %s -march=x86 -mattr=+sse2 | FileCheck %s

define <2 x double> @foo() nounwind {
  ret <2 x double> bitcast (<2 x i64><i64 -1, i64 -1> to <2 x double>)
; CHECK: foo:
; CHECK: pcmpeqd %xmm{{[0-9]+}}, %xmm{{[0-9]+}}
; CHECK-NEXT: ret
}
define <2 x double> @bar() nounwind {
  ret <2 x double> bitcast (<2 x i64><i64 0, i64 0> to <2 x double>)
; CHECK: bar:
; CHECK: xorps %xmm{{[0-9]+}}, %xmm{{[0-9]+}}
; CHECK-NEXT: ret
}
