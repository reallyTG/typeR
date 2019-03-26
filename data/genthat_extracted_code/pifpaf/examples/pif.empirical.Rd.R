library(pifpaf)


### Name: pif.empirical
### Title: Point Estimate of the Potential Impact Fraction via the
###   Empirical Method
### Aliases: pif.empirical
### Keywords: internal

### ** Examples


#Example 1: Relative risk given by exponential
#--------------------------------------------
set.seed(18427)
X        <- data.frame(rnorm(100,3,.5))
thetahat <- 0.12
rr       <- function(X, theta){exp(theta*X)}
pif.empirical(X, thetahat, rr, cft = function(X){ 0.5*X })

#Without counterfactual estimates PAF
pif.empirical(X, thetahat, rr) 
 
#Example 2: Linear relative risk
#--------------------------------------------
pif.empirical(X, thetahat, rr = function(X, theta){theta*X + 1}, 
               cft = function(X){ 0.5*X })

#Example 3: Multivariate relative risk
#--------------------------------------------
set.seed(18427)
X1       <- rnorm(100,4,1)
X2       <- rnorm(100,2,0.4)
X        <- data.frame(cbind(X1,X2))
thetahat <- c(0.12, 0.03)
rr       <- function(X, theta){exp(theta[1]*X[,1] + theta[2]*X[,2])}

#Creating a counterfactual. As rr requires a bivariate input, cft should 
#return a two-column matrix
cft  <- function(X){
   cbind(X[,1]/2, 1.1*X[,2])
}
pif.empirical(X, thetahat, rr, cft) 




