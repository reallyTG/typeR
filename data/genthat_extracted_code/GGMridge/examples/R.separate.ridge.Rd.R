library(GGMridge)


### Name: R.separate.ridge
### Title: Estimation of Partial Correlation Matrix Using p Separate Ridge
###   Regressions.
### Aliases: R.separate.ridge

### ** Examples

  p <- 100 # number of variables
  n <- 50 # sample size
	
  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = p, etaA = 0.02, n = n, r = 1)
  data <- simulation$data[[1L]]
  stddata <- scale(x = data, center = TRUE, scale = FALSE)
    
  ###############################
  # estimate ridge parameter
  ###############################
  w.upper <- which(upper.tri(diag(p)))

  lambda.array <- seq(from = 0.1, to = 20, by=0.1) * (n-1.0)
  partial.sep <-  R.separate.ridge(x = stddata,
                                   lambda = lambda.array,
                                   fold = 5L,
                                   verbose = TRUE)$R[w.upper]



