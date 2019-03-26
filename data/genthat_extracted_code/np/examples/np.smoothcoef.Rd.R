library(np)


### Name: npscoef
### Title: Smooth Coefficient Kernel Regression
### Aliases: npscoef npscoef.call npscoef.default npscoef.formula
###   npscoef.scbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): 
##D 
##D n <- 250
##D x <- runif(n)
##D z <- runif(n, min=-2, max=2)
##D y <- x*exp(z)*(1.0+rnorm(n,sd = 0.2))
##D bw <- npscoefbw(y~x|z)
##D model <- npscoef(bw)
##D plot(model)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): 
##D 
##D n <- 250
##D x <- runif(n)
##D z <- runif(n, min=-2, max=2)
##D y <- x*exp(z)*(1.0+rnorm(n,sd = 0.2))
##D bw <- npscoefbw(xdat=x, ydat=y, zdat=z)
##D model <- npscoef(bw)
##D plot(model)
## End(Not run) 



