library(pcaPP)


### Name: l1median
### Title: Multivariate L1 Median
### Aliases: l1median
### Keywords: multivariate robust

### ** Examples

  l1median(rnorm(100), trace = -1) # this returns the median of the sample

  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(200, rep(0, 4), diag(c(1, 1, 2, 2))), 
             rmvnorm( 50, rep(3, 4), diag(rep(2, 4))))
  l1median(x, trace = -1)
  # compare with coordinate-wise median:
  apply(x,2,median)



