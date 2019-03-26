library(Boom)


### Name: boxplot.mcmc.matrix
### Title: Plot the distribution of a matrix
### Aliases: boxplot.mcmc.matrix BoxplotMcmcMatrix
### Keywords: hplot

### ** Examples

  X <- array(rnorm(1000 * 3 * 4), dim=c(1000, 3, 4))
  dimnames(X)[[2]] <- paste("row", 1:3)
  dimnames(X)[[3]] <- paste("col", 1:4)
  BoxplotMcmcMatrix(X)

  truth <- 0
  BoxplotMcmcMatrix(X, truth=truth)

  truth <- matrix(rnorm(12), ncol=4)
  BoxplotMcmcMatrix(X, truth=truth)



