library(pifpaf)


### Name: risk.ratio.approximate.confidence
### Title: Approximate Confidence intervals for the Risk Ratio Integral
### Aliases: risk.ratio.approximate.confidence
### Keywords: internal

### ** Examples

## Not run: 
##D #' #Example 1: Exponential Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X        <- data.frame(rnorm(100))
##D thetahat <- 0.1
##D thetavar <- 0.2
##D Xmean    <- data.frame(mean(X[,1]))
##D Xvar     <- var(X[,1])
##D rr      <- function(X,theta){exp(X*theta)}
##D risk.ratio.approximate.confidence(Xmean, Xvar, thetahat, rr, thetavar)
##D 
##D #We can force RR'.s CI to be >= 1.
##D #This should be done with extra methodological (philosophical) care as 
##D #RR>= 1 should only be assumed with absolute mathematical certainty
##D risk.ratio.approximate.confidence(Xmean, Xvar, thetahat, rr, thetavar, force.min = TRUE)
##D 
##D #Example 2: Multivariate Relative Risk
##D #--------------------------------------------
##D set.seed(18427)
##D X1        <- rnorm(1000)
##D X2        <- runif(1000)
##D X         <- data.frame(t(colMeans(cbind(X1,X2))))
##D Xvar      <- cov(cbind(X1,X2))
##D thetahat  <- c(0.02, 0.01)
##D thetavar  <- matrix(c(0.1, 0, 0, 0.4), byrow = TRUE, nrow = 2)
##D rr        <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
##D risk.ratio.approximate.confidence(X, Xvar, thetahat, rr, thetavar) 
## End(Not run)




