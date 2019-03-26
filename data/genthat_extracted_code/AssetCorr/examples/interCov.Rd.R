library(AssetCorr)


### Name: interCov
### Title: Covariance Matching Estimator
### Aliases: interCov
### Keywords: interCov interCov

### ** Examples

set.seed(10)
d1=defaultTimeseries(1000,0.1,10,0.01)
d2=defaultTimeseries(1000,0.2,10,0.01)
n1=n2=rep(1000,10)

InterCorr=interCov(d1,n1,d2,n2,0.1,0.2)


## No test: 
InterCorr=interCov(d1,n1,d2,n2,0.1,0.2, JC=TRUE)
InterCorr=interCov(d1,n1,d2,n2,0.1,0.2, B=1000, CI_Boot=0.95)

InterCorr=interCov(d1,n1,d2,n2,0.1,0.2, DB=c(50,50))

## End(No test)




