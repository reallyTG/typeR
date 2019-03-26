library(riskyr)


### Name: dec.neg
### Title: Number of individuals for which the decision is negative.
### Aliases: dec.neg
### Keywords: datasets

### ** Examples

dec.neg <- 1000 * .67   # => sets dec.neg to 67% of 1000 = 670 cases.
is_freq(dec.neg)        # => TRUE
is_prob(dec.neg)        # => FALSE, as dec.neg is no probability (but ppod, NPV and FOR are)



