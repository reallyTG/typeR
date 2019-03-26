library(tscount)


### Name: plot.interv_multiple
### Title: Plot for Iterative Intervention Detection Procedure for Count
###   Time Series following Generalised Linear Models
### Aliases: plot.interv_multiple
### Keywords: Intervention detection

### ** Examples

## Not run: 
##D ###Campylobacter infections in Canada (see help("campy"))
##D campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
##D campyfit_intervmultiple <- interv_multiple(fit=campyfit, taus=80:120,
##D                               deltas=c(0,0.8,1), external=FALSE, B=2,
##D                               signif_level=0.05) #runs several hours!
##D plot(campyfit_intervmultiple)
## End(Not run)



