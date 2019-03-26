library(wavethresh)


### Name: rcov
### Title: Computes robust estimate of covariance matrix
### Aliases: rcov
### Keywords: robust multivariate

### ** Examples

#
# A standard normal data matrix with 3 variables, 100 observations
#
v <- matrix(rnorm(100*3), nrow=3, ncol=100)
#
# Robust covariance
#
rcov(v)



