library(np)


### Name: npsdeptest
### Title: Kernel Consistent Serial Dependence Test for Univariate
###   Nonlinear Processes
### Aliases: npsdeptest
### Keywords: univar nonparametric

### ** Examples

## Not run: 
##D set.seed(1234)
##D 
##D ## A function to create a time series
##D 
##D ar.series <- function(phi,epsilon) {
##D   n <- length(epsilon)
##D   series <- numeric(n)
##D   series[1] <- epsilon[1]/(1-phi)
##D   for(i in 2:n) {
##D     series[i] <- phi*series[i-1] + epsilon[i]
##D   }
##D   return(series)
##D }
##D 
##D n <- 100
##D 
##D ## Stationary persistent time-series
##D 
##D yt <- ar.series(0.95,rnorm(n))
##D npsdeptest(yt,lag.num=2,boot.num=99,method="summation")
##D 
##D Sys.sleep(5)
##D 
##D ## Stationary independent time-series
##D 
##D yt <- ar.series(0.0,rnorm(n))
##D npsdeptest(yt,lag.num=2,boot.num=99,method="summation")
##D 
##D ## Stationary persistent time-series
##D 
##D yt <- ar.series(0.95,rnorm(n))
##D npsdeptest(yt,lag.num=2,boot.num=99,method="integration")
##D 
##D Sys.sleep(5)
##D 
##D ## Stationary independent time-series
##D 
##D yt <- ar.series(0.0,rnorm(n))
##D npsdeptest(yt,lag.num=2,boot.num=99,method="integration")
##D 
## End(Not run) 




