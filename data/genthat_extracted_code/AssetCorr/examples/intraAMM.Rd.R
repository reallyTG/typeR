library(AssetCorr)


### Name: intraAMM
### Title: Asymptotic Method of Moments Estimator
### Aliases: intraAMM
### Keywords: AMM AMM

### ** Examples

set.seed(111)
d=defaultTimeseries(1000,0.3,20,0.01)
n=rep(1000,20)

IntraCorr=intraAMM(d,n)

#Jackknife correction
IntraCorr=intraAMM(d,n, JC=TRUE)

## No test: 
#Bootstrap correction with confidence intervals
IntraCorr=intraAMM(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with confidence intervals and plot
IntraCorr=intraAMM(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraAMM(D1,N1, DB=c(10,50))
## End(No test)




