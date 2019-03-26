library(tscount)


### Name: residuals.tsglm
### Title: Residuals of a Generalised Linear Model for Time Series of
###   Counts
### Aliases: residuals.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
campyfit_resid <- residuals(campyfit, type="pearson")
plot(campyfit_resid)
acf(campyfit_resid)



