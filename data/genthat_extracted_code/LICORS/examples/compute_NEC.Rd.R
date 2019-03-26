library(LICORS)


### Name: compute_NEC
### Title: Compute Negative Entropy Criterion (NEC)
### Aliases: compute_NEC
### Keywords: array manip

### ** Examples

WW <- matrix(c(rexp(10, 1/10), runif(10)), ncol = 5, byrow = FALSE)
WW <- normalize(WW)
compute_NEC(WW, -2, -1)



