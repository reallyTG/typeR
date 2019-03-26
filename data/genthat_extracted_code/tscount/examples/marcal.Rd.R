library(tscount)


### Name: marcal
### Title: Predictive Model Assessment with a Marginal Calibration Plot
### Aliases: marcal marcal.default marcal.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
marcal(campyfit)



