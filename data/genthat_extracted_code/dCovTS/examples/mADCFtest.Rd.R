library(dCovTS)


### Name: mADCFtest
### Title: Distance Correlation test of independence in multivariate time
###   series
### Aliases: mADCFtest
### Keywords: htest

### ** Examples

x<-MASS::mvrnorm(300,rep(0,2),diag(2))
n <- length(x)
c <- 3
lambda <- 0.1
p <- ceiling(c*n^lambda)
## Not run: 
##D mT=mADCFtest(x,type="tr",p=p,b=499,parallel=TRUE)
##D mF=mADCFtest(x,type="tr",p=p,b=499,parallel=FALSE)
## End(Not run)



