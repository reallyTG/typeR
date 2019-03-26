library(riskyr)


### Name: prev
### Title: The prevalence (baseline probability) of a condition.
### Aliases: prev baserate_cond.true
### Keywords: datasets

### ** Examples

prev <- .10     # => sets a prevalence value of 10%
prev <- 10/100  # => (condition = TRUE) for 10 out of 100 individuals
is_prob(prev)   # => TRUE (as prev is a probability)




