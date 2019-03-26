library(pifpaf)


### Name: paf.confidence.one2one
### Title: Approximate Confidence Intervals for the Population Attributable
###   Fraction with one to one expected value of RR function, and
###   unidimensional theta values
### Aliases: paf.confidence.one2one
### Keywords: internal

### ** Examples


#Example 1: Exponential Relative Risk
#--------------------------------------------
set.seed(18427)
X <- data.frame(rnorm(1000, 3,.7))
thetahat <- 0.4
thetalow <- 0.1
thetaup  <- 0.7
paf.confidence.one2one(X, thetahat, function(X, theta){exp(theta*X)}, 
thetalow, thetaup)

#Approximate method:
Xmean <- data.frame(mean(X[,1]))
Xvar  <- var(X[,1])
paf.confidence.one2one(Xmean, thetahat, function(X, theta){exp(theta*X)}, 
thetalow, thetaup, Xvar = Xvar, method = "approximate")

#Example 2: Multivariate example
#--------------------------------------------
set.seed(18427)
X1 <- rnorm(1000,3,.7)
X2 <- rnorm(1000,3,.7)
X  <- data.frame(X1,X2)
thetahat <- c(0.12, 0.03)
thetalow <- c(0.05, 0.01)
thetaup  <- c(0.25, 0.06)
rr <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
paf.confidence.one2one(X, thetahat, rr, thetalow, thetaup) 

#Approximate method:
Xmean <- data.frame(t(colMeans(X)))
Xvar  <- var(X)
paf.confidence.one2one(Xmean, thetahat, 
function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}, 
thetalow, thetaup, 
Xvar = Xvar, method = "approximate")




