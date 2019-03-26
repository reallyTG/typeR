library(dsa)


### Name: outlier
### Title: Outlier adjustment of daily time series
### Aliases: outlier

### ** Examples

set.seed(356)
x <- arima.sim(list(order = c(1,1,0), ar = 0.7), n = 365*4)
timeseries <- ts(x, freq=365, start=c(2001,1))
shocks <- rbinom(length(timeseries), 1, 0.002) * 1.5 * timeseries
timeseries <- timeseries + shocks
modelfit <- arima(timeseries, order = c(1,1,0))
out <- outlier(timeseries, model=modelfit, cval=8)
ts.plot(timeseries, out$series_adj, col=c("red", "black"))
Names = c("Original Series", "Outlier Adjusted")
legend(2004.2, 140, Names, col=c("red", "black"), lty=1, bty="n", cex=0.75)



