library(forecast)


### Name: forecast.baggedModel
### Title: Forecasting using a bagged model
### Aliases: forecast.baggedModel
### Keywords: ts

### ** Examples

fit <- baggedModel(WWWusage)
fcast <- forecast(fit)
plot(fcast)

## Not run: 
##D fit2 <- baggedModel(WWWusage, fn="auto.arima")
##D fcast2 <- forecast(fit2)
##D plot(fcast2)
##D accuracy(fcast2)
## End(Not run)




