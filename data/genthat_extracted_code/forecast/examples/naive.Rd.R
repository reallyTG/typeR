library(forecast)


### Name: rwf
### Title: Naive and Random Walk Forecasts
### Aliases: rwf naive print.naive snaive
### Keywords: ts

### ** Examples


gold.fcast <- rwf(gold[1:60], h=50)
plot(gold.fcast)


plot(naive(gold,h=50),include=200)


plot(snaive(wineind))




