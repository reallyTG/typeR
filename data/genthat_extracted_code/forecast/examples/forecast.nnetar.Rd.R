library(forecast)


### Name: forecast.nnetar
### Title: Forecasting using neural network models
### Aliases: forecast.nnetar
### Keywords: ts

### ** Examples

## Fit & forecast model
fit <- nnetar(USAccDeaths, size=2)
fcast <- forecast(fit, h=20)
plot(fcast)

## Not run: 
##D ## Include prediction intervals in forecast
##D fcast2 <- forecast(fit, h=20, PI=TRUE, npaths=100)
##D plot(fcast2)
##D 
##D ## Set up out-of-sample innovations using cross-validation
##D fit_cv <- CVar(USAccDeaths,  size=2)
##D res_sd <- sd(fit_cv$residuals, na.rm=TRUE)
##D myinnovs <- rnorm(20*100, mean=0, sd=res_sd)
##D ## Forecast using new innovations
##D fcast3 <- forecast(fit, h=20, PI=TRUE, npaths=100, innov=myinnovs)
##D plot(fcast3)
## End(Not run)




