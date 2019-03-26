library(riskyr)


### Name: cond.true
### Title: Number of individuals for which the condition is true.
### Aliases: cond.true
### Keywords: datasets

### ** Examples

cond.true <- 1000 * .10   # => sets cond.true to 10% of 1000 = 100 cases.
is_freq(cond.true)        # => TRUE
is_prob(cond.true)        # => FALSE, as cond.true is no probability (but prev and sens are)



