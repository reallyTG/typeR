library(pifpaf)


### Name: pif.confidence.approximate.loglinear
### Title: Confidence Intervals for the Potential Impact Fraction when only
###   mean and variance of exposure values is available using loglinear
###   method
### Aliases: pif.confidence.approximate.loglinear
### Keywords: internal

### ** Examples


#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(46987)
rr      <- function(X,theta){exp(X*theta)}
cft     <- function(X){0.4*X}
Xmean   <- data.frame(3)
Xvar    <- 1
theta   <- 0.4
thetavar <- 0.001
pif.confidence.approximate.loglinear(Xmean, Xvar, theta, thetavar, rr, cft,
nsim = 1000)

#Example 2: Multivariate Relative Risk
#--------------------------------------------
X1       <- rnorm(100,3,.5)
X2       <- rnorm(100,4,1)
X        <- data.frame(cbind(X1,X2))
Xmean    <- t(as.matrix(colMeans(X)))
Xvar     <- cov(X)
thetahat <- c(0.12, 0.17)
thetavar  <- matrix(c(0.001, 0.00001, 0.00001, 0.004), byrow = TRUE, nrow = 2)
rr       <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
pif.confidence.approximate.loglinear(Xmean, Xvar, thetahat, thetavar, 
rr, cft = function(X){0.8*X}, nsim = 100)




