library(riskyr)


### Name: comp_prob_prob
### Title: Compute probabilities from (3 essential) probabilities.
### Aliases: comp_prob_prob

### ** Examples

# Basics:
comp_prob_prob(prev = .11, sens = .88, spec = .77)                        # => ok: PPV = 0.3210614
comp_prob_prob(prev = .11, sens = NA, mirt = .12, spec = NA, fart = .23)  # => ok: PPV = 0.3210614
comp_prob_prob()          # => ok, using current defaults
length(comp_prob_prob())  # => 10 probabilities

# Ways to work:
comp_prob_prob(.99, sens = .99, spec = .99)              # => ok: PPV = 0.999898
comp_prob_prob(.99, sens = .90, spec = NA, fart = .10)   # => ok: PPV = 0.9988789

# Watch out for extreme cases:
comp_prob_prob(1, sens = 0, spec = 1)      # => ok, but with warnings (as PPV & FDR are NaN)
comp_prob_prob(1, sens = 0, spec = 0)      # => ok, but with warnings (as PPV & FDR are NaN)
comp_prob_prob(1, sens = 0, spec = NA, fart = 0)  # => ok, but with warnings (as PPV & FDR are NaN)
comp_prob_prob(1, sens = 0, spec = NA, fart = 1)  # => ok, but with warnings (as PPV & FDR are NaN)

comp_prob_prob(1, sens = 1, spec = 0)      # => ok, but with warnings (as NPV & FOR are NaN)
comp_prob_prob(1, sens = 1, spec = 1)      # => ok, but with warnings (as NPV & FOR are NaN)
comp_prob_prob(1, sens = 1, spec = NA, fart = 0)  # => ok, but with warnings (as NPV & FOR are NaN)
comp_prob_prob(1, sens = 1, spec = NA, fart = 1)  # => ok, but with warnings (as NPV & FOR are NaN)

# Ways to fail:
comp_prob_prob(NA, 1, 1, NA)  # => only warning: invalid set (prev not numeric)
comp_prob_prob(8,  1, 1, NA)  # => only warning: prev no probability
comp_prob_prob(1,  8, 1, NA)  # => only warning: sens no probability
comp_prob_prob(1,  1, 1,  1)  # => only warning: is_complement not in tolerated range





