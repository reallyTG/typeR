library(midasr)


### Name: predict.midas_r
### Title: Predict method for MIDAS regression fit
### Aliases: predict.midas_r

### ** Examples

data("USrealgdp")
data("USunempr")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr), start = 1949)

##24 high frequency lags of x included
mr <- midas_r(y ~ fmls(x, 23, 12, nealmon), start = list(x = rep(0, 3)))

##Declining unemployment
xn <- rnorm(2 * 12, -0.1, 0.1)

##Only one predicted value, historical values discarded
predict(mr, list(x = xn))

##Historical values taken into account
forecast(mr, list(x = xn))



