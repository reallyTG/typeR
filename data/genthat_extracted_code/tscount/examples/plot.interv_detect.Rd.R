library(tscount)


### Name: plot.interv_detect
### Title: Plot Test Statistic of Intervention Detection Procedure for
###   Count Time Series Following Generalised Linear Models
### Aliases: plot.interv_detect
### Keywords: Intervention detection

### ** Examples

## Not run: 
##D ###Campylobacter infections in Canada (see help("campy"))
##D campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
##D campyfit_intervdetect <- interv_detect(fit=campyfit, taus=80:120,
##D                         delta=1, external=FALSE)
##D #This example runs about 20 minutes on a single processing unit,
##D #of course depending on its speed.
##D plot(campyfit_intervdetect)
## End(Not run)



