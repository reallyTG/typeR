library(riskyr)


### Name: dec.cor
### Title: Number of individuals for which the decision is correct.
### Aliases: dec.cor
### Keywords: datasets

### ** Examples

dec.cor <- 1000 * .50   # => sets dec.cor to 50% of 1000 = 500 cases.
is_freq(dec.cor)        # => TRUE
is_prob(dec.cor)        # => FALSE, as dec.cor is no probability (but acc, bacc/wacc ARE)



