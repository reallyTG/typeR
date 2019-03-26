library(AssetCorr)


### Name: intraJDP1
### Title: Joint Default Probability Matching Estimator, Lucas (1995)
### Aliases: intraJDP1
### Keywords: JDP1 JDP1

### ** Examples

set.seed(111)
d=defaultTimeseries(1000,0.3,20,0.01)
n=rep(1000,20)

IntraCorr=intraJDP1(d,n)
#Jackknife correction
IntraCorr=intraJDP1(d,n, JC=TRUE)

## No test: 
#Bootstrap correction with confidence intervals
IntraCorr=intraJDP1(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with confidence intervals and plot
IntraCorr=intraJDP1(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraJDP1(D1,N1, DB=c(10,50))

## End(No test)




