library(riskyr)


### Name: comp_NPV
### Title: Compute a decision's negative predictive value (NPV) from
###   probabilities.
### Aliases: comp_NPV

### ** Examples

# (1) Ways to work:
comp_NPV(.50, .500, .500)  # => NPV = 0.5
comp_NPV(.50, .333, .666)  # => NPV = 0.4996

# (2) Watch out for vectors:
prev <- seq(0, 1, .1)
comp_NPV(prev, .5, .5)  # => without NaN values
comp_NPV(prev,  1,  0)  # => with NaN values

# (3) Watch out for extreme values:
comp_NPV(1, 1, 1)   # => NaN, as cr = 0 and mi = 0: 0/0
comp_NPV(1, 1, 0)   # => NaN, as cr = 0 and mi = 0: 0/0
comp_NPV(.5, sens = 1, spec = 0)  # => NaN, no dec.neg cases:  NPV = 0/0 = NaN
is_extreme_prob_set(.5, sens = 1, spec = 0)  # => verifies extreme cases





