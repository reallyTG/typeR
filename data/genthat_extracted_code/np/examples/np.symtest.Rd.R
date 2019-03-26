library(np)


### Name: npsymtest
### Title: Kernel Consistent Density Asymmetry Test with Mixed Data Types
### Aliases: npsymtest
### Keywords: univar nonparametric

### ** Examples

## Not run: 
##D set.seed(1234)
##D 
##D n <- 100
##D 
##D ## Asymmetric discrete probability distribution function
##D 
##D x <- factor(rbinom(n,2,.8))
##D npsymtest(x,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Symmetric discrete probability distribution function
##D 
##D x <- factor(rbinom(n,2,.5))
##D npsymtest(x,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Asymmetric continuous distribution function
##D 
##D y <- rchisq(n,df=2)
##D npsymtest(y,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Symmetric continuous distribution function
##D 
##D y <- rnorm(n)
##D npsymtest(y,boot.num=99)
##D 
##D ## Time-series bootstrap
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
##D ## Asymmetric time-series
##D 
##D yt <- ar.series(0.5,rchisq(n,df=3))
##D npsymtest(yt,boot.num=99,boot.method="geom")
##D 
##D ## Symmetric time-series
##D 
##D yt <- ar.series(0.5,rnorm(n))
##D npsymtest(yt,boot.num=99,boot.method="geom")
##D 
## End(Not run) 




