library(tscount)


### Name: predict.tsglm
### Title: Predicts Method for Time Series of Counts Following Generalised
###   Linear Models
### Aliases: predict.tsglm
### Keywords: Prediction

### ** Examples

###Campylobacter infections in Canada (see help("campy"))
campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
predict(campyfit, n.ahead=1) #prediction interval using conditional distribution
predict(campyfit, n.ahead=5, global=TRUE) #prediction intervals using parametric bootstrap



