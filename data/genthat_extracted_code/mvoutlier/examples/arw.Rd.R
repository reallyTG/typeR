library(mvoutlier)


### Name: arw
### Title: Adaptive reweighted estimator for multivariate location and
###   scatter
### Aliases: arw
### Keywords: dplot

### ** Examples

x <- cbind(rnorm(100), rnorm(100))
arw(x, apply(x,2,mean), cov(x))



