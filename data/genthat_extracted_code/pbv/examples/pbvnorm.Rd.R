library(pbv)


### Name: pbvnorm
### Title: Probabilities for Bivariate Normal Distribution
### Aliases: pbvnorm dbvnorm

### ** Examples

#############################################################################
# EXAMPLE 1: Comparison with alternative implementations
#############################################################################

#*** simulate different values of ordinates and correlations
set.seed(9898)
N <- 3000
x <- stats::runif(N,-3,3)
y <- stats::runif(N,-3,3)
rho <- stats::runif(N,-.95,.95)

#*** compute probabilities
res1 <- pbv::pbvnorm(x=x,y=y,rho=rho)

#-- compare results with pbivnorm package
library(pbivnorm)
res2 <- pbivnorm::pbivnorm(x=x, y=y, rho=rho)

summary(abs(res1-res2))

#*** compute density values
log <- TRUE    # logical indicating whether log density should be evaluated
res1 <- pbv::dbvnorm(x=x, y=y, rho=rho, log=log )

## Not run: 
##D #-- compare results with mvtnorm package
##D library(mvtnorm)
##D res2 <- rep(NA, N)
##D sigma <- diag(2)
##D for (ii in 1:N){
##D     sigma[1,2] <- sigma[2,1] <- rho[ii]
##D     res2[ii] <- mvtnorm::dmvnorm(x=c(x[ii],y[ii]), sigma=sigma, log=log)
##D }
##D summary(abs(res1-res2))
## End(Not run)



