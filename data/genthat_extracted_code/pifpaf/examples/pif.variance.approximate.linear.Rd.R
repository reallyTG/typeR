library(pifpaf)


### Name: pif.variance.approximate.linear
### Title: Approximate Variance for the Potential Impact Fraction using the
###   approximate method
### Aliases: pif.variance.approximate.linear
### Keywords: internal

### ** Examples

## Not run: 
##D #Example 1: Exponential Relative risk
##D #--------------------------------------------
##D set.seed(46987)
##D rr       <- function(X,theta){exp(X*theta)}
##D cft      <- function(X){0.5*X}
##D X        <- rbeta(100, 2, 3)
##D Xmean    <- data.frame(mean(X))
##D Xvar     <- var(X)
##D theta    <- 1.2
##D thetavar <- 0.15
##D pif.variance.approximate.linear(Xmean, theta, rr, thetavar, Xvar, cft) 
##D 
##D #Example 2: Multivariate example
##D #--------------------------------------------
##D X1       <- rnorm(1000,3,.5)
##D X2       <- rnorm(1000,4,1)
##D X        <- data.frame(cbind(X1,X2))
##D Xmean    <- matrix(colMeans(X), ncol = 2)
##D Xvar     <- cov(X)
##D theta    <- c(0.12, 0.17)
##D thetavar  <- matrix(c(0.001, 0.00001, 0.00001, 0.004), byrow = TRUE, nrow = 2)
##D rr       <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
##D pif.variance.approximate.linear(Xmean, theta, rr, thetavar, Xvar,
##D cft = function(X){cbind(0.5*X[,1],0.4*X[,2])}, check_integrals = FALSE)
## End(Not run)



