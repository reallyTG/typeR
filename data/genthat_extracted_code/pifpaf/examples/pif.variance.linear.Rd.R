library(pifpaf)


### Name: pif.variance.linear
### Title: Approximate Variance for the Potential Impact Fraction
### Aliases: pif.variance.linear
### Keywords: internal

### ** Examples


#Example 1: Exponential Relative risk
#--------------------------------------------
set.seed(18427)
X <- data.frame(rnorm(100,3,.5))
thetahat <- 0.12
thetavar <- 0.1
pif.variance.linear(X, thetahat, function(X, theta){exp(theta*X)}, 
                    thetavar, nsim = 100) 

#Same example with linear counterfactual
cft      <- function(X){0.3*X}
pif.variance.linear(X, thetahat, function(X, theta){exp(theta*X)}, 
                    thetavar, cft, nsim = 100) 
                    
#Example 2: Multivariate case
#--------------------------------------------
## Not run: 
##D set.seed(18427)
##D X1 <- rnorm(100, 3,.5)
##D X2 <- runif(100, 1, 1.5)
##D X  <- data.frame(cbind(X1,X2))
##D thetahat <- c(0.1, 0.03)
##D thetavar <- matrix(c(0.1, 0, 0, 0.05), byrow = TRUE, nrow = 2)
##D rr        <- function(X, theta){
##D            .X <- as.matrix(X, ncol = 2)
##D            exp(theta[1]*.X[,1] + theta[2]*.X[,2])
##D            }
##D cft <- function(X){0.5*X}
##D pif.variance.linear(X, thetahat, rr, thetavar, cft, nsim = 100) 
## End(Not run)



