library(timsac)


### Name: canarm
### Title: Canonical Correlation Analysis of Scalar Time Series
### Aliases: canarm
### Keywords: ts

### ** Examples

# "arima.sim" is a function in "stats".
# Note that the sign of MA coefficient is opposite from that in "timsac".
y <- arima.sim(list(order=c(2,0,1), ar=c(0.64,-0.8), ma=c(-0.5)), n = 1000)
z <- canarm(y, max.order = 30)
z$arcoef
z$macoef



