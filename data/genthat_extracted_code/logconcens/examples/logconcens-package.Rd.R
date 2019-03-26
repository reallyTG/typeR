library(logconcens)


### Name: logconcens-package
### Title: Maximum likelihood estimation of a log-concave density based on
###   censored data.
### Aliases: logconcens-package logconcens
### Keywords: package

### ** Examples

## Simple examples with simulated data.
## For more detailed examples see the help for the function logcon.

## exact data
set.seed(10)
x <- rnorm(100)
res <- logcon(x)
## Not run: 
##D plot(res)
##D xi <- seq(-3,3,0.05)
##D lines(xi,log(dnorm(xi)))
## End(Not run)

## interval censored data
x <- rgamma(50,3,1)
x <- cbind(x,x+rexp(50,1))
plotint(x)
res <- logcon(x)
## Not run: plot(res, type="CDF")

## right censored data with mass at infinity
set.seed(11)
x <- rgamma(50,3,1)
x <- cbind(x,ifelse(rexp(50,1/3) < x,Inf,x))
plotint(x)
res <- logcon(x,adapt.p0=TRUE)
## Not run: plot(res, type="survival")

## rounded/binned data
set.seed(12)
x <- round(rnorm(100))
x <- cbind(x-0.5,x+0.5)
plotint(x)
res <- logcon(x)
## Not run: 
##D plot(res)
##D xi <- seq(-3,3,0.05)
##D lines(xi,log(dnorm(xi)))
## End(Not run)



