library(bayesSurv)


### Name: sampleCovMat
### Title: Compute a sample covariance matrix.
### Aliases: sampleCovMat
### Keywords: multivariate

### ** Examples

  ## Sample some values
  z1 <- rnorm(100, 0, 1)           ## first components of y
  z2 <- rnorm(100, 5, 2)           ## second components of y
  z3 <- rnorm(100, 10, 0.5)        ## third components of y

  ## Put them into a data.frame
  sample <- data.frame(z1, z2, z3)

  ## Compute a sample covariance matrix
  sampleCovMat(sample)



