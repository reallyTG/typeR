library(riskyr)


### Name: comp_ppod
### Title: Compute the proportion of positive decisions (ppod) from
###   probabilities.
### Aliases: comp_ppod

### ** Examples

# (1) ways to work:
comp_ppod(.10, .200, .300)  # => ppod = 0.65
comp_ppod(.50, .333, .666)  # => ppod = 0.3335

# (2) watch out for vectors:
prev <- seq(0, 1, .1)
comp_ppod(prev, .8, .5)  # => 0.50 0.53 0.56 0.59 0.62 0.65 0.68 0.71 0.74 0.77 0.80
comp_ppod(prev,  0,  1)  # => 0 0 0 0 0 0 0 0 0 0 0

# (3) watch out for extreme values:
comp_ppod(1, 1, 1)  #  => 1
comp_ppod(1, 1, 0)  #  => 1

comp_ppod(1, 0, 1)  #  => 0
comp_ppod(1, 0, 0)  #  => 0

comp_ppod(0, 1, 1)  #  => 0
comp_ppod(0, 1, 0)  #  => 1

comp_ppod(0, 0, 1)  #  => 0
comp_ppod(0, 0, 0)  #  => 1





