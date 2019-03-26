library(tscount)


### Name: pit
### Title: Predictive Model Assessment with a Probability Integral
###   Transform Histogram
### Aliases: pit pit.default pit.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
pit(campyfit)



