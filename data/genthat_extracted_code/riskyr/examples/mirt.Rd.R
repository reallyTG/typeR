library(riskyr)


### Name: mirt
### Title: The miss rate of a decision process or diagnostic procedure.
### Aliases: mirt FNR beta
### Keywords: datasets

### ** Examples

mirt <- .15     # => sets a miss rate of 15%
mirt <- 15/100  # => (decision = negative) for 15 out of 100 people with (condition = TRUE)
is_prob(mirt)   # => TRUE (as mirt is a probability)



