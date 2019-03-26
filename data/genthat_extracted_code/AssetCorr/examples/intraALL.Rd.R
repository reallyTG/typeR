library(AssetCorr)


### Name: intraALL
### Title: Function to use multiple estimators simultaneously
### Aliases: intraALL
### Keywords: ALL ALL

### ** Examples


## No test: 
set.seed(10)
d=defaultTimeseries(1000,0.01,20,0.01)
n=rep(1000,20)

#Point Estimate of all available estimators:
intraALL(d,n,Adjust=0.001, plot=TRUE)

#Bootstrap corrected estimates of all available estimators:
IntraCorr=intraALL(d,n, Adjust=0.001, B=500, CI_Boot=0.95 , plot=TRUE, show_progress=TRUE)

#Select some estimators
IntraCorr=intraALL(d,n,B=500,  CI_Boot=0.95, Adjust=0.001 ,Estimator=c("AMM","FMM"), plot=TRUE)

#Jackknife correction
IntraCorr=intraALL(d,n, JC=TRUE,Adjust=0.001, plot=TRUE)

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraALL(d,n, DB=c(10,50),Adjust=0.001, plot=TRUE)

## End(No test)





