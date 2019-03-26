library(accSDA)


### Name: SZVD_kFold_cv
### Title: Cross-validation of sparse zero variance discriminant analysis
### Aliases: SZVD_kFold_cv SZVD_kFold_cv.default

### ** Examples

  P <- 150 # Number of variables
  N <- 20 # Number of samples per class

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
  Ytrain <- cbind(c(rep(1,N),rep(0,2*N)),
                  c(rep(0,N),rep(1,N),rep(0,N)),
                  c(rep(0,2*N),rep(1,N)))

  # Normalize the data
  Xt <- accSDA::normalize(Xtrain)
  Xtrain <- Xt$Xc

  # Train the classifier and increase the sparsity parameter from the default
  # so we penalize more for non-sparse solutions.
  res <- accSDA::SZVD_kFold_cv(Xtrain,Ytrain,folds=2,gams=2,beta=2.5,q=1, D=diag(P),
                              maxits=50,tol=list(abs=1e-2,rel=1e-2),
                              ztol=1e-3,feat=0.3,quiet=FALSE,penalty=TRUE)



