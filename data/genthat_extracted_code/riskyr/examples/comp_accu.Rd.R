library(riskyr)


### Name: comp_accu
### Title: Compute acccuracy of current classification results.
### Aliases: comp_accu

### ** Examples

comp_accu()  # => computes accuracy metrics for current default scenario
comp_accu(hi = 1, mi = 2, fa = 3, cr = 4)  # medium accuracy, but cr > hi

# Extreme cases:
comp_accu(hi = 1, mi = 1, fa = 1, cr = 1)  # random performance
comp_accu(hi = 1, mi = 0, fa = 0, cr = 1)  # perfect accuracy/optimal performance
comp_accu(hi = 0, mi = 1, fa = 1, cr = 0)  # zero accuracy/worst performance, but see f1s
comp_accu(hi = 1, mi = 0, fa = 0, cr = 0)  # perfect accuracy, but see wacc and mcc

# Effects of w:
comp_accu(hi = 3, mi = 2, fa = 1, cr = 4, w = 1/2)  # equal weights to sens and spec
comp_accu(hi = 3, mi = 2, fa = 1, cr = 4, w = 2/3)  # more weight to sens
comp_accu(hi = 3, mi = 2, fa = 1, cr = 4, w = 1/3)  # more weight to spec





