library(GGMridge)


### Name: lambda.cv
### Title: Choose the Tuning Parameter of the Ridge Inverse
### Aliases: lambda.cv

### ** Examples

  p <- 100 # number of variables
  n <- 50 # sample size
	
  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = p, etaA = 0.02, n = n, r = 1)
  data <- simulation$data[[1L]]
  stddata <- scale(x = data, center = TRUE, scale = TRUE)
    
  ###############################
  # estimate ridge parameter
  ###############################
  lambda.array <- seq(from = 0.1, to = 20, by = 0.1) * (n - 1.0)
  fit <- lambda.cv(x = stddata, lambda = lambda.array, fold = 10L)
  lambda <- fit$lambda[which.min(fit$spe)] / (n - 1.0)
    
  ###############################
  # calculate partial correlation 
  # using ridge inverse
  ###############################
  partial <- solve(lambda*diag(p) + cor(data))
  partial <- -scaledMat(x = partial)



