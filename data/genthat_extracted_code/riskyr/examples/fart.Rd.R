library(riskyr)


### Name: fart
### Title: The false alarm rate (or false positive rate) of a decision
###   process or diagnostic procedure.
### Aliases: fart FPR alpha fallout
### Keywords: datasets

### ** Examples

fart <- .25     # => sets a false alarm rate of 25%
fart <- 25/100  # => (decision = positive) for 25 out of 100 people with (condition = FALSE)
is_prob(fart)   # => TRUE (as fart is a probability)



