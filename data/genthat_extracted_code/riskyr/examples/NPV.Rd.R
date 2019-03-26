library(riskyr)


### Name: NPV
### Title: The negative predictive value of a decision process or
###   diagnostic procedure.
### Aliases: NPV
### Keywords: datasets

### ** Examples

NPV <- .95     # => sets a negative predictive value of 95%
NPV <- 95/100  # => (condition = FALSE) for 95 out of 100 people with (decision = negative)
is_prob(NPV)   # => TRUE (as NPV is a probability)



