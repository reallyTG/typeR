library(GMCM)


### Name: EStep
### Title: Steps of the EM algorithm for a Gaussian Mixture model
### Aliases: EStep MStep
### Keywords: internal

### ** Examples

set.seed(1)
sim <- GMCM:::SimulateGMMData(n = 100)
x <- sim$z
true.theta <- sim$theta
init.theta <- GMCM:::rtheta()  # Generate starting parameters

# Do one EM interation
es <- GMCM:::EStep(x, init.theta)
new.theta <- GMCM:::MStep(x, es)

# Compare current estimate with the true
new.theta
true.theta



