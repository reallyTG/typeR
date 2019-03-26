library(CircStats)


### Name: wrpcauchy.ml
### Title: Wrapped Cauchy Maximum Likelihood Estimates
### Aliases: wrpcauchy.ml
### Keywords: htest

### ** Examples

# Generate data from a wrapped Cauchy distribution.
data <- rwrpcauchy(50, 0, 0.75)
# Compute the sample mean direction and resultant length.
mu0 <- circ.mean(data)
rho0 <- est.rho(data)
# Estimate the MLE's of the Cauchy distribution parameters.
wrpcauchy.ml(data, mu0, rho0)



