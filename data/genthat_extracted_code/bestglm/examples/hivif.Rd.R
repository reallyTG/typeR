library(bestglm)


### Name: hivif
### Title: Simulated Linear Regression (Train) with Nine Highly Correlated
###   Inputs
### Aliases: hivif
### Keywords: datasets

### ** Examples

#Simple example
data(hivif)
lm(y ~ ., data=hivif)
#
#This example shows how the original data was simulated and
#how additional test data may be simulated.
## Not run: 
##D  set.seed(778851) #needed for original training data
##D  n <- 100
##D  p <- 9 #9 covariates plus intercept
##D  sig <- toeplitz(0.9^(0:(p-1)))
##D  X <- MASS::mvrnorm(n=n, rep(0, p), Sigma=sig)
##D  colnames(X) <- paste0("x", 1:p)
##D  b <- c(0,-0.3,0,0,-0.3,0,0,0.3,0.3) #
##D  names(b) <- paste0("x", 1:p)
##D  y <- 1 +  X##D 
##D  Xy <- cbind(as.data.frame.matrix(X), y=y) #=hivif
##D #Test data
##D  nTe <- 10^3
##D  XTe <- MASS::mvrnorm(n=nTe, rep(0, p), Sigma=sig)
##D  colnames(XTe) <- paste0("x", 1:p)
##D   yTe <- 1 +  XTe##D 
##D  XyTe <- cbind(as.data.frame.matrix(XTe), y=yTe) #test data
##D  ans <- lm(y ~ ., data=Xy) #fit training data
##D  mean((XyTe$y - predict(ans, newdata=XyTe))^2) #MSE on test data
##D  
## End(Not run)



