library(pifpaf)


### Name: pif.approximate
### Title: Point Estimate of the Potential Impact Fraction via the
###   approximate method.
### Aliases: pif.approximate
### Keywords: internal

### ** Examples


#Example 1
#--------------------------------------------
X         <- data.frame(2)
thetahat  <- 0.12
Xvar      <- 0.2
rr        <- function(X,theta){exp(X*theta)}
cft       <- function(X){0.5*X}
pif.approximate(X, Xvar, thetahat, rr, cft)

#Change the derivative arguments 
pif.approximate(X, Xvar, thetahat, rr, cft, 
               deriv.method = "Richardson", 
               deriv.method.args = list(eps=1e-8, d=0.000001))

#When no counterfactual is specified paf is calculated
pif.approximate(X, Xvar, thetahat, rr)

#Example 2: Multivariate
#--------------------------------------------
X1        <- 2
X2        <- 1.1
X         <- data.frame(X1,X2)
Xvar      <- matrix(c(1,.4,.4,1),ncol = 2, byrow = TRUE)
cft       <- function(X){.25*X}
thetahat  <- c(0.12, 0.03)
rr        <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
pif.approximate(X, Xvar, thetahat, rr, cft)

#Example 3: More multivariate
#--------------------------------------------
X1       <- rnorm(1000,3,.5)
X2       <- rnorm(1000,4,1)
X        <- cbind(X1,X2)
Xmean    <- data.frame(t(colMeans(X)))
Xvar     <- var(X)
thetahat <- c(0.12, 0.17)
thetavar <- matrix(c(0.001, 0.00001, 0.00001, 0.004), byrow = TRUE, nrow = 2)
rr       <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}
cft      <- function(X){cbind(sqrt(X[,1] + 0.2*X[,2]), X[,1])}
pif.approximate(Xmean, Xvar, thetahat, rr, cft)




