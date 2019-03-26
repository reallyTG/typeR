library(tscount)


### Name: scoring
### Title: Predictive Model Assessment with Proper Scoring Rules
### Aliases: scoring scoring.default scoring.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
scoring(campyfit)



