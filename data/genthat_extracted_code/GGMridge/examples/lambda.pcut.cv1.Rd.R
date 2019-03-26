library(GGMridge)


### Name: lambda.pcut.cv1
### Title: Choose the Tuning Parameter of the Ridge Inverse and
###   Thresholding Level of the Empirical p-Values.
### Aliases: lambda.pcut.cv1

### ** Examples

  p <- 100 # number of variables
  n <- 50 # sample size
	
  ###############################
  # Simulate data
  ###############################
  simulation <- simulateData(G = p, etaA = 0.02, n = n, r = 1)
  data <- simulation$data[[1L]]

  ###############################
  # Split into train/test sets
  ###############################
  testindex <- sample(1L:n, 10L)

  train <- data[-testindex,,drop = FALSE]
  stdTrain <- scale(x = train, center = TRUE, scale = TRUE)

  test <- data[testindex,,drop = FALSE]
  stdTest <- scale(x = test, center = TRUE, scale = TRUE)

  ###############################
  # Calculate total prediction 
  # errors for all candidate 
  # lambda and p-value cutoffs
  ###############################
  lambda.array <- seq(from = 0.1, to = 5, length = 10) * (n - 1.0)
  pcut.array <- seq(from = 0.01, to = 0.05, by = 0.01)
  tpe <- lambda.pcut.cv1(train = stdTrain,
                         test = stdTest,
                         lambda = lambda.array,
                         pcut = pcut.array)



