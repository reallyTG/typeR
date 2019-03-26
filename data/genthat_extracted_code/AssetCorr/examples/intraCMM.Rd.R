library(AssetCorr)


### Name: intraCMM
### Title: Corrected Asymptotic Method of Moments Estimator of Frei and
###   Wunsch (2018)
### Aliases: intraCMM
### Keywords: CMM CMM

### ** Examples

set.seed(10)
d=defaultTimeseries(1000,0.1,10,0.01)
n=rep(1000,10)

IntraCorr=intraCMM(d,n,l=0)


#Estimation with  two lags of autocorrelation
IntraCorr=intraCMM(d,n, l=2 )

#Jackknife correction
IntraCorr=intraCMM(d,n, JC=TRUE)



## No test: 
#Bootstrap correction with  bootstrap confidence intervals
IntraCorr=intraCMM(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with  bootstrap confidence intervals and plot
IntraCorr=intraCMM(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraCMM(D1,N1, DB=c(10,50))

## End(No test)



