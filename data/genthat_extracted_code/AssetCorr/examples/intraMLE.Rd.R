library(AssetCorr)


### Name: intraMLE
### Title: Binomial Maximum Likelihood Estimator
### Aliases: intraMLE
### Keywords: MLE MLE

### ** Examples

set.seed(11)
d=defaultTimeseries(1000,0.3,20,0.01)
n=rep(1000,20)

IntraCorr=intraMLE(d,n)

#Estimation with confidence intervals
IntraCorr=intraMLE(d,n, CI=0.95 )





## No test: 
#Jackknife correction
IntraCorr=intraMLE(d,n, JC=TRUE)

#Bootstrap correction with bootstrap confidence intervals
IntraCorr=intraMLE(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with bootstrap confidence intervals and plot
IntraCorr=intraMLE(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraMLE(D1,N1, DB=c(10,50))

## End(No test)




