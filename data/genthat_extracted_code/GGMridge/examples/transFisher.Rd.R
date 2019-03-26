library(GGMridge)


### Name: transFisher
### Title: Fisher's Z-Transformation
### Aliases: transFisher

### ** Examples

  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = 100, etaA = 0.02, n = 50, r = 1)
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

  ###############################
  # Fisher's Z transformation of 
  # upper diagonal of the partial 
  # correlation matrix
  ###############################
  w.upper <- which(upper.tri(diag(nrow(dat))))
  psi <- transFisher(x = partial[w.upper])



