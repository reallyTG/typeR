library(SHIP)


### Name: shrink.estim
### Title: Shrinkage estimator of the covariance matrix, given a data set
###   and a covariance target.
### Aliases: shrink.estim
### Keywords: methods multivariate

### ** Examples

# Simulate dataset
x <- matrix(rnorm(20*30),20,30)
# Try different targets
shrink.estim(x,tar=build.target(x,type="D"))



