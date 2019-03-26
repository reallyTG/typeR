library(forecast)


### Name: forecast
### Title: Forecasting time series
### Aliases: forecast print.forecast summary.forecast
###   as.data.frame.forecast as.ts.forecast forecast.default forecast.ts
### Keywords: ts

### ** Examples


WWWusage %>% forecast %>% plot
fit <- ets(window(WWWusage, end=60))
fc <- forecast(WWWusage, model=fit)




