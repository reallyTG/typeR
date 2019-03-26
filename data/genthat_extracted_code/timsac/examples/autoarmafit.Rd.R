library(timsac)


### Name: autoarmafit
### Title: Automatic ARMA Model Fitting
### Aliases: autoarmafit print.autoarmafit
### Keywords: ts

### ** Examples

# "arima.sim" is a function in "stats".
# Note that the sign of MA coefficient is opposite from that in "timsac".
y <- arima.sim(list(order=c(2,0,1),ar=c(0.64,-0.8),ma=-0.5), n = 1000)
autoarmafit(y)



