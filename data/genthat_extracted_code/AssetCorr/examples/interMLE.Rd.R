library(AssetCorr)


### Name: interMLE
### Title: Binomial Maximum Likelihood Estimator
### Aliases: interMLE
### Keywords: interMLE interMLE

### ** Examples


## No test: 
d1=defaultTimeseries(1000,0.1,10,0.01)
d2=defaultTimeseries(1000,0.2,10,0.01)
n1=n2=rep(1000,10)

InterCorr=interMLE(d1,n1,d2,n2,0.1,0.2, CI=0.95)

InterCorr=interMLE(d1,n1,d2,n2,0.1,0.2, JC=TRUE)

InterCorr=interMLE(d1,n1,d2,n2,0.1,0.2, B=1000, CI_Boot=0.95)

InterCorr=interMLE(d1,n1,d2,n2,0.1,0.2, DB=c(10,50))
## End(No test)






