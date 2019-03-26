library(riskyr)


### Name: PPV
### Title: The positive predictive value of a decision process or
###   diagnostic procedure.
### Aliases: PPV precision
### Keywords: datasets

### ** Examples

PPV <- .55     # => sets a positive predictive value of 55%
PPV <- 55/100  # => (condition = TRUE) for 55 out of 100 people with (decision = positive)
is_prob(PPV)   # => TRUE (as PPV is a probability)




