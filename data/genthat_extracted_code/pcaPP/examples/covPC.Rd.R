library(pcaPP)


### Name: covPC
### Title: Covariance Matrix Estimation from princomp Object
### Aliases: covPC
### Keywords: multivariate

### ** Examples

  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(200, rep(0, 6), diag(c(5, rep(1,5)))),
             rmvnorm( 15, c(0, rep(20, 5)), diag(rep(1, 6))))
  pc <- princomp(x)
  covPC(pc, k=2)



