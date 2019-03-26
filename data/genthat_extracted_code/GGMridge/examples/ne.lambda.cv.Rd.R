library(GGMridge)


### Name: ne.lambda.cv
### Title: Choose the Tuning Parameter of a Ridge Regression Using
###   Cross-Validation
### Aliases: ne.lambda.cv

### ** Examples

  p <- 100 # number of variables
  n <- 50 # sample size
	
  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = p, etaA = 0.02, n = n, r = 1)
  data <- simulation$data[[1L]]
  stddat <- scale(x = data, center = TRUE, scale = TRUE)

  X <- stddat[,-1L,drop = FALSE]
  y <- stddat[,1L]

  fit.lambda <- ne.lambda.cv(y = y,
                             x = X,
                             lambda = seq(from = 0.01, to = 1,by = 0.1),
                             fold = 10L)  

  lambda <- fit.lambda$lambda[which.min(fit.lambda$spe)] 



