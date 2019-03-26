library(pcaPP)


### Name: plotcov
### Title: Compare two Covariance Matrices in Plots
### Aliases: plotcov
### Keywords: multivariate

### ** Examples

  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(200, rep(0, 6), diag(c(5, rep(1,5)))),
             rmvnorm( 15, c(0, rep(20, 5)), diag(rep(1, 6))))
  plotcov(covPCAproj(x),covPCAgrid(x))




