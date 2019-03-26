library(fpc)


### Name: cov.wml
### Title: Weighted Covariance Matrices (Maximum Likelihood)
### Aliases: cov.wml
### Keywords: multivariate

### ** Examples

  x <- c(1,2,3,4,5,6,7,8,9,10)
  y <- c(1,2,3,8,7,6,5,8,9,10)
  cov.wml(cbind(x,y),wt=c(0,0,0,1,1,1,1,1,0,0))
  cov.wt(cbind(x,y),wt=c(0,0,0,1,1,1,1,1,0,0))



