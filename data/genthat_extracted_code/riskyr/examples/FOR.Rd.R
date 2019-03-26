library(riskyr)


### Name: FOR
### Title: The false omission rate (FOR) of a decision process or
###   diagnostic procedure.
### Aliases: FOR
### Keywords: datasets

### ** Examples

FOR <- .05     # => sets a false omission rate of 5%
FOR <- 5/100   # => (condition = TRUE) for 5 out of 100 people with (decision = negative)
is_prob(FOR)   # => TRUE (as FOR is a probability)



