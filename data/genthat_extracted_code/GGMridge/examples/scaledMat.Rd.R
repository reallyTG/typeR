library(GGMridge)


### Name: scaledMat
### Title: Scale a square matrix
### Aliases: scaledMat

### ** Examples

  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = 100, etaA = 0.02, n = 50, r = 10)
  dat <- simulation$data[[1L]]
  correlation <- scaledMat(x = cov(dat))



