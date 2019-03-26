library(riskyr)


### Name: spec
### Title: The specificity of a decision process or diagnostic procedure.
### Aliases: spec TNR
### Keywords: datasets

### ** Examples

spec <- .75     # => sets a specificity value of 75%
spec <- 75/100  # => (decision = negative) for 75 out of 100 people with (condition = FALSE)
is_prob(spec)   # => TRUE (as spec is a probability)



