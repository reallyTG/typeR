library(AssetCorr)


### Name: intraJDP2
### Title: Joint Default Probability Matching Estimator, De Servigny and
###   Renault (2002)
### Aliases: intraJDP2
### Keywords: JDP2 JDP2

### ** Examples

set.seed(10)
d=defaultTimeseries(1000,0.3,20,0.01)
n=rep(1000,20)

IntraCorr=intraJDP2(d,n)
#Jackknife correction
IntraCorr=intraJDP2(d,n, JC=TRUE)

## No test: 
#Bootstrap correction with confidence intervals
IntraCorr=intraJDP2(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with confidence intervals and plot
IntraCorr=intraJDP2(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraJDP2(D1,N1, DB=c(10,50))
## End(No test)




