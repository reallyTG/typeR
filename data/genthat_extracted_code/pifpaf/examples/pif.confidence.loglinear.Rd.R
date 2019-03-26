library(pifpaf)


### Name: pif.confidence.loglinear
### Title: Confidence intervals for the Potencial Impact Fraction, using
###   the loglinear method
### Aliases: pif.confidence.loglinear
### Keywords: internal

### ** Examples


#Example 1: Exponential Relative risk
#--------------------------------------------
set.seed(18427)
X        <- as.data.frame(rnorm(100,5,1))
thetahat <- 0.4
thetavar <- 0.1
cft      <- function(X){sqrt(X)}
pif.confidence.loglinear(X, thetahat, thetavar, rr = function(X, theta){exp(theta*X)}, cft)

#Same example with linear counterfactual
a    <- 0.5
cft  <- function(X){a*X}
pif.confidence.loglinear(X, thetahat, thetavar, function(X, theta){exp(theta*X)})

#' #Example 2: Multivariate Relative Risk
#--------------------------------------------
set.seed(18427)
X1        <- rnorm(100, 4,0.01)
X2        <- runif(100,0.4,2)
X         <- as.data.frame(cbind(X1,X2))
thetahat  <- c(0.12, 0.03)
thetavar  <- matrix(c(0.01, 0, 0, 0.04), byrow = TRUE, nrow = 2)
rr        <- function(X, theta){
           .X <- as.matrix(X, ncol = 2)
           exp(theta[1]*.X[,1] + theta[2]*.X[,2])
           }
pif.confidence.loglinear(X, thetahat, thetavar, rr) 




