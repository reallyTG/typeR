library(dCovTS)


### Name: mADCVtest
### Title: Distance covariance test of independence in multivariate time
###   series
### Aliases: mADCVtest

### ** Examples

x<-MASS::mvrnorm(500,rep(0,2),diag(2))
n <- length(x)
c <- 3
lambda <- 0.1
p <- ceiling(c*n^lambda)
## Not run: 
##D mT=mADCVtest(x,type="bar",p=p,b=499,parallel=TRUE)
##D mF=mADCVtest(x,type="bar",p=p,b=499,parallel=FALSE)
## End(Not run)



