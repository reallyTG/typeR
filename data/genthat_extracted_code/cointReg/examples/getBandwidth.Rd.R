library(cointReg)


### Name: getBandwidth
### Title: Automatic Bandwidth Selection
### Aliases: getBandwidth getBandwidthAnd getBandwidthNW

### ** Examples

set.seed(1909)
x <- rnorm(100)
getBandwidth(x, kernel = "ba")
getBandwidth(x, bandwidth = "nw", kernel = "ba")

x2 <- arima.sim(model = list(ar = c(0.7, 0.2)), innov = x, n = 100)
getBandwidth(x2, kernel = "qs")
getBandwidth(x2, bandwidth = "nw", kernel = "qs")




