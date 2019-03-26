library(LICORS)


### Name: estimate_state_probs
### Title: Estimate conditional/marginal state probabilities
### Aliases: estimate_state_probs
### Keywords: distribution multivariate nonparametric

### ** Examples

WW <- matrix(runif(10000), ncol = 10)
WW <- normalize(WW)
estimate_state_probs(WW)



