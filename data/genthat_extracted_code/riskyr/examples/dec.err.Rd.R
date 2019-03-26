library(riskyr)


### Name: dec.err
### Title: Number of individuals for which the decision is erroneous.
### Aliases: dec.err
### Keywords: datasets

### ** Examples

dec.err <- 1000 * .50   # => sets dec.err to 50% of 1000 = 500 cases.
is_freq(dec.err)        # => TRUE
is_prob(dec.err)        # => FALSE, as dec.err is no probability (but acc, bacc/wacc ARE)



