library(pifpaf)


### Name: paf.confidence.inverse
### Title: Confidence intervals for the Population Attributable Fraction,
###   using the inverse method
### Aliases: paf.confidence.inverse
### Keywords: internal

### ** Examples

 ## Not run: 
##D #Example 1: Exponential Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X <- as.data.frame(rnorm(100,0.3,.05))
##D thetahat <- 0.4
##D thetavar <- 0.1
##D paf.confidence.inverse(X, thetahat, function(X, theta){exp(theta*X)}, thetavar)
##D 
##D 
##D #With approximate method
##D Xmean <- as.data.frame(mean(X[,1]))
##D Xvar  <- var(X)
##D paf.confidence.inverse(Xmean, thetahat, 
##D function(X, theta){exp(theta*X)}, thetavar, Xvar = Xvar, method = "approximate")
##D 
##D #We can force PAF's CI to be >= 0 (only if it is certain)
##D paf.confidence.inverse(X, thetahat, 
##D function(X, theta){exp(theta*X)}, thetavar, force.min = TRUE)
##D 
##D #Example 2: Multivariate Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X1 <- rnorm(1000,0.3,.05)
##D X2 <- rnorm(1000,0.3,.05)
##D X  <- as.data.frame(as.matrix(cbind(X1,X2)))
##D thetahat <- c(0.12, 0.03)
##D thetavar <- matrix(c(0.1, 0, 0, 0.4), byrow = TRUE, nrow = 2)
##D rr <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
##D paf.confidence.inverse(X, thetahat, rr, thetavar) 
##D 
##D #Same example with approximate method
##D Xmean    <- as.data.frame(matrix(colMeans(X), ncol = 2))
##D Xvar     <- cov(X)
##D paf.confidence.inverse(Xmean, thetahat, rr=rr, thetavar = thetavar, 
##D method = "approximate", Xvar = Xvar)
## End(Not run)




