library(riskyr)


### Name: sens
### Title: The sensitivity (or hit rate) of a decision process or
###   diagnostic procedure.
### Aliases: sens TPR HR power recall
### Keywords: datasets

### ** Examples

sens <- .85     # => sets a sensitivity value of 85%
sens <- 85/100  # => (decision = positive) for 85 out of 100 people with (condition = TRUE)
is_prob(sens)   # => TRUE (as sens is a probability)



