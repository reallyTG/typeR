library(midasr)


### Name: simulate.midas_r
### Title: Simulate MIDAS regression response
### Aliases: simulate simulate.midas_r

### ** Examples

data("USrealgdp")
data("USunempr")

y <- diff(log(USrealgdp))
x <- window(diff(USunempr), start = 1949)
trend <- 1:length(y)

##24 high frequency lags of x included
mr <- midas_r(y ~ trend + fmls(x, 23, 12, nealmon), start = list(x = rep(0, 3)))

simulate(mr, nsim=10, future=FALSE)

##Forecast horizon
h <- 3
##Declining unemployment
xn <- rep(-0.1, 12*3)
##New trend values
trendn <- length(y) + 1:h

simulate(mr, nsim = 10, future = TRUE, newdata = list(trend = trendn, x = xn))



