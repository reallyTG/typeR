library(cointReg)


### Name: getLongRunVar
### Title: Long-Run Variance
### Aliases: getLongRunVar

### ** Examples

set.seed(1909)
x <- rnorm(100)
band <- getBandwidthAnd(x, kernel = "ba")
getLongRunVar(x, kernel = "ba", bandwidth = band)
# shorter:
getLongRunVar(x, kernel = "ba", bandwidth = "and")

x2 <- arima.sim(model = list(ar = c(0.7, 0.2)), innov = x, n = 100)
x2 <- cbind(a = x2, b = x2 + rnorm(100))
getLongRunVar(x2, kernel = "ba", bandwidth = "nw")




