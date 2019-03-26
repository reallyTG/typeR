library(pifpaf)


### Name: pif.confidence.linear
### Title: Confidence Intervals for the Potential Impact Fraction using
###   Delta Method
### Aliases: pif.confidence.linear
### Keywords: internal

### ** Examples

## Not run: 
##D #Example with risk given by HR (PAF)
##D set.seed(18427)
##D X <- as.data.frame(rnorm(100,3,.5))
##D thetahat <- 0.12
##D thetavar <- 0.1
##D pif.confidence.linear(X, thetahat, function(X, theta){exp(theta*X)}, 
##D                       thetavar, nsim = 100)
##D 
##D #Example with linear counterfactual
##D cft      <- function(X){0.3*X}
##D pif.confidence.linear(X, thetahat, function(X, theta){exp(theta*X)}, 
##D                      thetavar, cft, nsim = 100)
##D 
##D #Example with theta and X multivariate
##D set.seed(18427)
##D X1 <- rnorm(100, 3,.5)
##D X2 <- rnorm(100,3,.5)
##D X  <- as.data.frame(as.matrix(cbind(X1,X2)))
##D thetahat <- c(0.1, 0.03)
##D thetavar <- matrix(c(0.1, 0, 0, 0.05), byrow = TRUE, nrow = 2)
##D rr       <- function(X, theta){
##D            .X <- as.matrix(X, ncol = 2)
##D            exp(theta[1]*.X[,1] + theta[2]*.X[,2])
##D            }
##D cft <- function(X){0.5*X}
##D pif.confidence.linear(X, thetahat, rr, thetavar, cft) 
## End(Not run)




