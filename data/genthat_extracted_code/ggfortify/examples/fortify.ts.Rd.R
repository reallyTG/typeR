library(ggfortify)


### Name: fortify.ts
### Title: Convert time-series-like to data.frame
### Aliases: fortify.ts

### ** Examples

fortify(AirPassengers)
fortify(timeSeries::as.timeSeries(AirPassengers))
fortify(tseries::irts(cumsum(rexp(10, rate = 0.1)), matrix(rnorm(20), ncol=2)))
fortify(stats::stl(UKgas, s.window = 'periodic'))
fortify(stats::decompose(UKgas))



