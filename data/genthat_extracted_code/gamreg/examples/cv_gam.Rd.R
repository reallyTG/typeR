library(gamreg)


### Name: cv.gam
### Title: Robust Cross-Validation
### Aliases: cv.gam

### ** Examples

  ## generate data
  library(mvtnorm)
  n <- 30                      # number of observations
  p <- 10                      # number of expalanatory variables

  epsilon <- 0.1               # contamination ratio

  beta0 <- 0.0                 # intercept
  beta <- c(numeric(p))        # regression coefficients
  beta[1] <- 1
  beta[2] <- 2
  beta[3] <- 3
  beta[4] <- 4

  Sigma <- 0.2^t(sapply(1:p, function(i, j) abs(i-j), 1:p))
  X <- rmvnorm(n, sigma=Sigma) # explanatory variables
  e <- rnorm(n) # error terms

  i <- 1:ceiling(epsilon*n)    # index of outliers
  e[i] <- e[i] + 20            # vertical outliers
  Y <- beta0*(numeric(n)+1) + X%*%beta


  res <- cv.gam(X,Y,nlambda = 5, nlambda.LTS=20 ,init.mode="sLTS")





