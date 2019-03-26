library(cmm)


### Name: TestCronbachAlpha
### Title: Testing Cronbach's alpha using marginal models
### Aliases: TestCronbachAlpha
### Keywords: datasets

### ** Examples

data(TestCronbachAlpha)

#Example 1: Testing H01.
  
  # Invoke cmm
  library(cmm)

  # Data
  TestCronbachAlphaH1 <- TestCronbachAlpha[1 : 200, 2 : 11]
  
  # Transform data into vector of frequencies n
  n <- as.matrix(table(apply(TestCronbachAlphaH1, 1, paste, collapse = "")))

  # Specify number of items
  J <- 10 
  
  # Specify number of item scores
  K <- 2 
  
  # Specify criterion for Hypothesis H01
  criterion <- .75

  # Compute object coeff
  coeff <- SpecifyCoefficient(name = "CronbachAlpha", arg = list(list(1 : J), K),
    data = TestCronbachAlphaH1)

  # Compute object at (marginal matrix)
  L <- ncol(coeff[[1]][[5]])
  at <- diag(L)

  # Compute object bt (constraint matrix)
  bt <- matrix(1)
  
  # Compute object d
  d <- criterion

  # Compute CMM
  model <- list(bt, coeff, at, d)
  fit <- MarginalModelFit(n, model, MaxError = 1e-04)

#Example 2: Testing H02.
## No test: 
          
  # Data
  TestCronbachAlphaH2 <- TestCronbachAlpha[1 : 400, 1 : 11]
  
  # Transform data into vector of frequencies n
  n <- as.matrix(table(apply(TestCronbachAlphaH2, 1, paste, collapse = "")))

  # Specify number of items
  J <- 10

  # Specify number of item scores
  K <- 2
  
  # Compute object coeff
  coeff <- SpecifyCoefficient(name = "CronbachAlpha", arg = list(list(2 : (J + 1),
    2 : (J + 1)), c(K, K), 1), data = TestCronbachAlphaH2,)

  # Compute object at (marginal matrix)
  L <- ncol(coeff[[1]][[5]])
  at <- diag(L)

  # Compute object bt (constraint matrix)
  bt <- matrix(c(1,-1),1,2)

  # Compute object d
  d <- rep(0,nrow(bt))

  # Compute CMM
  model <- list(bt,coeff,at,d)
  fit <- MarginalModelFit(n, model, MaxError = 1e-04)
## End(No test)  
#Example 3: Testing H03.
## No test: 
          
  # Data
  TestCronbachAlphaH3 <- TestCronbachAlpha[1 : 200, 2 : 21]

  # Transform data into vector of frequencies n
  n <- as.matrix(table(apply(TestCronbachAlphaH3, 1, paste, collapse = "")))

  # Specify number of items
  J <- 20

  # Specify number of item scores
  K <- 2
  
  # Specify which items belong to which test
  test1 <-  1 : 10
  test2 <- 11 : 20
  
  # Compute object coeff
  coeff <- SpecifyCoefficient(name = "CronbachAlpha", arg = list(list(test1,
     test2), c(K, K)), data = TestCronbachAlphaH3,)

  # Compute object at (marginal matrix)
  x <- dimnames(n)[[1]]
  p1 <- sort(unique(substr(x, test1[1] ,test1[length(test1)])))
  p2 <- sort(unique(substr(x, test2[1] ,test2[length(test2)])))
  U1 <- matrix(NA, length(p1), length(x))
  for (h1 in 1 : length(p1))
  U1[h1, ] <- as.numeric(substr(x, test1[1], test1[length(test1)]) == p1[h1])
  U2 <- matrix(NA, length(p2), length(x))
  for (h2 in 1 : length(p2))
  U2[h2, ] <- as.numeric(substr(x, test2[1], test2[length(test2)]) == p2[h2])
  at <- rbind(U1, U2)

  # Compute object bt (constraint matrix)
  bt <- matrix(c(1, -1), 1, 2)

  # Compute object d
  d <- rep(0, nrow(bt))

  # Compute CMM
  model <- list(bt, coeff, at, d)
  fit <- MarginalModelFit(n, model, MaxError = 1e-04)
## End(No test)



