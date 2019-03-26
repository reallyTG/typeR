library(ltsk)


### Name: cltsk
### Title: Function calls 'ltsk' using cumulatively expanding time space
###   thresholds. This function is useful when predictions are needed using
###   data points at different spatiotemporal intervals.  For example, if
###   predictions are needed at a given location for the past 30 days at an
###   interval of 3 days.  Instead of using 'ltsk' 10 times, 'cltsk' can
###   compute all 10 values simultaneously.
### Aliases: cltsk

### ** Examples

## load the data
data(ex)
data(epa_cl)
## apply log transformation
obs[,'pr_pm25'] = log(obs[,'pr_pm25'])
## run kriging
system.time(out <- cltsk(ex2.query[1:2,],obs,c(0.10,10),
  zcoord='pr_pm25',nbins=c(4,5),verbose=FALSE,cl=0))
table(out$flag)



