library(pifpaf)


### Name: pif.confidence.bootstrap
### Title: Pivotal Boostrap Confidence Intervals for Potential Impact
###   Fraction
### Aliases: pif.confidence.bootstrap
### Keywords: internal

### ** Examples

#Example 1: Exponential Relative Risk
#----------------------------------------
set.seed(18427)
X        <- rnorm(100,5,1)
thetahat <- 0.4
thetavar <- 0.1
pif.confidence.bootstrap(X, thetahat, thetavar, function(X, theta){exp(theta*X)}, 
                         nboost = 100) #nboost small only for example purposes

#This also works with kernel method
pif.confidence.bootstrap(X, thetahat, thetavar, function(X, theta){exp(theta*X)}, 
                         nboost = 100, method = "kernel") 

#Example 2: Multivariate example
#----------------------------------------
## Not run: 
##D set.seed(18427)
##D X1 <- rnorm(100, 1, 0.05)
##D X2 <- rnorm(100, 1, 0.05)
##D X  <- as.matrix(cbind(X1,X2))
##D thetahat <- c(2, 0.03)
##D thetavar <- matrix(c(0.1, 0, 0, 0.05), byrow = TRUE, nrow = 2)
##D rr        <- function(X, theta){
##D   .X <- as.matrix(X, ncol = 2)
##D   exp(theta[1]*.X[,1] + theta[2]*.X[,2])
##D }
##D cft <- function(X){0.5*X}#' cft <- function(X){0.95*X}
##D pif.confidence.bootstrap(X, thetahat, thetavar, rr, cft) 
## End(Not run)



