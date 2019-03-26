library(accSDA)


### Name: SZVD
### Title: Sparse Zero Variance Discriminant Analysis
### Aliases: SZVD SZVD.default

### ** Examples

  set.seed(123)
  P <- 300 # Number of variables
  N <- 50 # Number of samples per class

  # Mean for classes, they are zero everywhere except the first 3 coordinates
  m1 <- rep(0,P)
  m1[1] <- 3

  m2 <- rep(0,P)
  m2[2] <- 3

  m3 <- rep(0,P)
  m3[3] <- 3

  # Sample dummy data
  Xtrain <- rbind(MASS::mvrnorm(n=N,mu = m1, Sigma = diag(P)),
                 MASS::mvrnorm(n=N,mu = m2, Sigma = diag(P)),
                MASS::mvrnorm(n=N,mu = m3, Sigma = diag(P)))


  # Generate the labels
  Ytrain <- rep(1:3,each=N)

  # Normalize the data
  Xt <- accSDA::normalize(Xtrain)
  Xtrain <- Xt$Xc

  # Train the classifier and increase the sparsity parameter from the default
  # so we penalize more for non-sparse solutions.
  res <- accSDA::SZVD(cbind(Ytrain,Xtrain),beta=2.5,
                     maxits=1000,tol = list(abs = 1e-04, rel = 1e-04))



