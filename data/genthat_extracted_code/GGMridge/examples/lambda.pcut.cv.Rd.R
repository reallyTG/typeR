library(GGMridge)


### Name: lambda.pcut.cv
### Title: Choose the Tuning Parameter of the Ridge Inverse and
###   Thresholding Level of the Empirical p-Values
### Aliases: lambda.pcut.cv

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
  # Selection of a lambda and a 
  # p-value cutoff
  ###############################
  lambda.array <- seq(from = 0.1, to = 5, length = 10) * (n-1.0)
  pcut.array <- seq(from = 0.01, to = 0.05, by = 0.01)
  tpe <- lambda.pcut.cv(x = stddata,
                        lambda = lambda.array,
                        pcut = pcut.array,
                        fold = 3L)
  w.mintpe <- which(tpe == min(tpe), arr.ind = TRUE)
  lambda <- lambda.array[w.mintpe[1L]]
  alpha <- pcut.array[w.mintpe[2L]]



