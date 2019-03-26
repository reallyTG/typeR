library(pifpaf)


### Name: pif.conditional.variance.linear
### Title: Conditional Variance for the Potential Impact Fraction
### Aliases: pif.conditional.variance.linear
### Keywords: internal

### ** Examples


#Example 1: Exponential Relative risk
#--------------------------------------------
set.seed(18427)
X        <- data.frame(rnorm(100,3,.5))
thetahat <- 0.12
rr       <- function(X, theta){exp(theta*X)}

#When no counterfactual is specified calculates PAF
pif.conditional.variance.linear(X, thetahat,  rr)

#Example with linear counterfactual
cft      <- function(X){0.3*X}
pif.conditional.variance.linear(X, thetahat,  rr = function(X, theta){exp(theta*X)}, cft)

#Example 2: Multivariate case
#--------------------------------------------
set.seed(18427)
X1 <- rnorm(100, 3,.5)
X2 <- runif(100, 1, 1.5)
X  <- data.frame(cbind(X1,X2))
thetahat  <- c(0.1, 0.03)
rr        <- function(X, theta){
           .X <- as.matrix(X, ncol = 2)
           exp(theta[1]*.X[,1] + theta[2]*.X[,2])
           }
cft <- function(X){0.5*X}
pif.conditional.variance.linear(X, thetahat, rr, cft) 




