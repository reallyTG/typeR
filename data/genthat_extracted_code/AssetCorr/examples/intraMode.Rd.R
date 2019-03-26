library(AssetCorr)


### Name: intraMode
### Title: Parametric Approach of Botha and van Vuuren (2010)- Mode
### Aliases: intraMode
### Keywords: Mode Mode

### ** Examples

set.seed(111)
d=defaultTimeseries(1000,0.3,20,0.01)
n=rep(1000,20)

IntraCorr=intraMode(d,n)

#Jackknife correction
IntraCorr=intraMode(d,n, JC=TRUE)

## No test: 
#Bootstrap correction with confidence intervals
IntraCorr=intraMode(d,n, B=1000, CI_Boot=0.95 )

#Bootstrap correction with confidence intervals and plot
IntraCorr=intraMode(d,n, B=1000, CI_Boot=0.95, plot=TRUE )

#Double Bootstrap correction with 10 repetitions in the inner loop and 50 in the outer loop
IntraCorr=intraMode(D1,N1, DB=c(10,50))
## End(No test)




