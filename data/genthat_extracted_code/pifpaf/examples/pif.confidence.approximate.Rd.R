library(pifpaf)


### Name: pif.confidence.approximate
### Title: Approximate Confidence Intervals for the Population Attributable
###   Fraction
### Aliases: pif.confidence.approximate
### Keywords: internal

### ** Examples

## Not run: 
##D #Example 1: Exponential Relative risk
##D #--------------------------------------------
##D set.seed(46987)
##D rr      <- function(X,theta){exp(X*theta)}
##D cft     <- function(X){0.5*X}
##D X       <- runif(1000)
##D Xmean   <- data.frame(mean(X))
##D Xvar    <- var(X)
##D theta   <-  0.2
##D thetavar <- 0.015
##D pif.confidence.approximate(Xmean, Xvar, theta, thetavar, rr)
##D pif.confidence.approximate(Xmean, Xvar, theta, thetavar, rr, cft) 
##D 
##D #Example 2: Multivariate example
##D #--------------------------------------------
##D X1       <- rnorm(1000,3,.5)
##D X2       <- rnorm(1000,4,1)
##D X        <- as.matrix(cbind(X1,X2))
##D Xmean    <- data.frame(t(colMeans(X)))
##D Xvar     <- cov(X)
##D theta    <- c(0.12, 0.17)
##D thetavar  <- matrix(c(0.001, 0.00001, 0.00001, 0.004), byrow = TRUE, nrow = 2)
##D rr       <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
##D pif.confidence.approximate(Xmean, Xvar, theta, thetavar, rr, 
##D cft = function(X){cbind(0.5*X[,1],0.4*X[,2])})
## End(Not run)



