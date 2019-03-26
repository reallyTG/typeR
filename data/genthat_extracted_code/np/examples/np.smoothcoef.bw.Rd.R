library(np)


### Name: npscoefbw
### Title: Smooth Coefficient Kernel Regression Bandwidth Selection
### Aliases: npscoefbw npscoefbw.NULL npscoefbw.default npscoefbw.formula
###   npscoefbw.scbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA):
##D set.seed(42)
##D 
##D n <- 100
##D x <- runif(n)
##D z <- runif(n, min=-2, max=2)
##D y <- x*exp(z)*(1.0+rnorm(n,sd = 0.2))
##D bw <- npscoefbw(formula=y~x|z)
##D summary(bw)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): 
##D 
##D n <- 100
##D x <- runif(n)
##D z <- runif(n, min=-2, max=2)
##D y <- x*exp(z)*(1.0+rnorm(n,sd = 0.2))
##D bw <- npscoefbw(xdat=x, ydat=y, zdat=z)
##D summary(bw)
## End(Not run) 



