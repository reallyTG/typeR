library(AssetCorr)


### Name: intraAMLE
### Title: Asymptotic Maximum Likelihood Estimator
### Aliases: intraAMLE
### Keywords: AMLE AMLE

### ** Examples

set.seed(10)
d=defaultTimeseries(100,0.01,10,0.01)
n=rep(100,10)

#Sensitivity to the adjustment
intraAMLE(d,n,Adjust=0.001)
intraAMLE(d,n,Adjust=0.0001)

#Estimation with confidence intervals- I
IntraCorr=intraAMLE(d,n, Adjust=0.001, CI_1=0.95 )

#Estimation with confidence intervals- II
IntraCorr=intraAMLE(d,n, Adjust=0.001, CI_2=0.95 )

#Jackknife correction
IntraCorr=intraAMLE(d,n,Adjust=0.001, JC=TRUE)

## No test: 
#Bootstrap correction with  bootstrap confidence intervals
IntraCorr=intraAMLE(d,n, Adjust=0.001, B=1000, CI_Boot=0.95 )

#Bootstrap correction with  bootstrap confidence intervals and plot
IntraCorr=intraAMLE(d,n, B=1000, Adjust=0.001, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraAMLE(d,n,Adjust=0.001, DB=c(10,50))

## End(No test)





