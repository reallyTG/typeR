library(GGMridge)


### Name: lambda.TargetD
### Title: Shrinkage Estimation of a Covariance Matrix Toward an Identity
###   Matrix
### Aliases: lambda.TargetD

### ** Examples

  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = 100, etaA = 0.02, n = 50, r = 10)
  dat <- simulation$data[[1L]]
  stddat <- scale(x = dat, center = TRUE, scale = TRUE)

  shrinkage.lambda <- lambda.TargetD(x = stddat)

  ###############################
  # the ridge parameter
  ###############################
  ridge.lambda <- shrinkage.lambda / (1.0 - shrinkage.lambda)

  ###############################
  # partial correlation matrix
  ###############################
  partial <- solve(cor(dat) + ridge.lambda * diag(ncol(dat)))
  partial <- -scaledMat(x = partial)



