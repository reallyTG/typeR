library(pifpaf)


### Name: pif.kernel
### Title: Kernel-based estimate of Potential Impact Fraction
### Aliases: pif.kernel
### Keywords: internal

### ** Examples


#Example 1: Relative risk given by exponential
#--------------------------------------------
set.seed(18427)
X        <- data.frame(rnorm(100,3,.5))
thetahat <- 0.12
rr       <- function(X, theta){exp(theta*X)}
pif.kernel(X, thetahat, rr, cft = function(X){ 0.5*X })

#Choose a different kernel
pif.kernel(X, thetahat, rr, cft = function(X){ 0.5*X }, ktype = "gaussian")

#Specify kernel options
pif.kernel(X, thetahat, rr, cft = function(X){ 0.5*X }, ktype = "gaussian", 
bw = "nrd", adjust = 0.5, n = 1100)

#Without counterfactual estimates PAF
pif.kernel(X, thetahat, rr) 
 
#Example 2: Linear relative risk
#--------------------------------------------
pif.kernel(X, thetahat, rr = function(X, theta){theta*X + 1}, 
               cft = function(X){ 0.5*X })

#Example 3: More complex counterfactual
#--------------------------------------------
set.seed(18427)
X       <- data.frame(rnorm(100,4,1))
thetahat <- c(0.12, 0.03)
rr       <- function(X, theta){1 + theta[1]*X + theta[2]*X^2}

#Creating a counterfactual. As rr requires a bivariate input, cft should 
#return a two-column matrix
cft  <- function(X){
   X[which(X > 4)] <- 1
   return(X)
}
pif.kernel(X, thetahat, rr, cft) 




