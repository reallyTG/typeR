library(tscount)


### Name: QIC
### Title: Quasi Information Criterion of a Generalised Linear Model for
###   Time Series of Counts
### Aliases: QIC QIC.tsglm
### Keywords: Model assessment

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)), distr="nbinom")
QIC(campyfit)
AIC(campyfit)



