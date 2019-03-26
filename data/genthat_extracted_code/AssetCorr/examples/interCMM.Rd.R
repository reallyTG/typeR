library(AssetCorr)


### Name: interCMM
### Title: Corrected Asymptotic Method of Moments Estimator of Frei and
###   Wunsch (2018)
### Aliases: interCMM
### Keywords: interCMM interCMM

### ** Examples

d1=defaultTimeseries(1000,0.1,10,0.01)
d2=defaultTimeseries(1000,0.2,10,0.01)
n1=n2=rep(1000,10)

#Using the Covariance method to estimate the plug-in inter correlation.
inter_sys=interCov(d1,n1,d2,n2,0.1,0.2)$Original
inter_asset= inter_sys*sqrt(0.1*0.2)

interCMM(d1,n1,d2,n2,inter_asset,l=0)

## No test: 
InterCorr=interCMM(d1,n1,d2,n2,inter_asset, JC=TRUE)
InterCorr=interCMM(d1,n1,d2,n2,inter_asset, B=1000, CI_Boot=0.95, plot=TRUE)


InterCorr=interCMM(d1,n1,d2,n2,inter_asset, DB=c(10,50))
## End(No test)




