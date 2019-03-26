library(riskyr)


### Name: dec.pos
### Title: Number of individuals for which the decision is positive.
### Aliases: dec.pos
### Keywords: datasets

### ** Examples

dec.pos <- 1000 * .33   # => sets dec.pos to 33% of 1000 = 330 cases.
is_freq(dec.pos)        # => TRUE
is_prob(dec.pos)        # => FALSE, as dec.pos is no probability (but ppod and PPV are)



