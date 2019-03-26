library(riskyr)


### Name: comp_PPV
### Title: Compute a decision's positive predictive value (PPV) from
###   probabilities.
### Aliases: comp_PPV

### ** Examples

# (1) Ways to work:
comp_PPV(.50, .500, .500)  # => PPV = 0.5
comp_PPV(.50, .333, .666)  # => PPV = 0.499

# (2) Watch out for vectors:
prev <- seq(0, 1, .1)
comp_PPV(prev, .5, .5)  # => without NaN values
comp_PPV(prev,  0,  1)  # => with NaN values

# (3) Watch out for extreme values:
comp_PPV(prev = 1, sens = 0, spec = .5)  # => NaN, only mi: hi = 0 and fa = 0: PPV = 0/0 = NaN
is_extreme_prob_set(prev = 1, sens = 0, spec = .5)  # => verifies extreme cases

comp_PPV(prev = 0, sens = .5, spec = 1)  # => NaN, only cr: hi = 0 and fa = 0: PPV = 0/0 = NaN
is_extreme_prob_set(prev = 0, sens = .5, spec = 1)  # => verifies extreme cases

comp_PPV(prev = .5, sens = 0, spec = 1)  # => NaN, only cr: hi = 0 and fa = 0: PPV = 0/0 = NaN
is_extreme_prob_set(prev = .5, sens = 0, spec = 1)  # => verifies extreme cases





