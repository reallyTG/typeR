library(forecastHybrid)


### Name: hybridModel
### Title: Hybrid time series modeling
### Aliases: hybridModel

### ** Examples

## Not run: 
##D 
##D # Fit an auto.arima, ets, thetam, nnetar, stlm, and tbats model
##D # on the time series with equal weights
##D mod1 <- hybridModel(AirPassengers)
##D plot(forecast(mod1))
##D 
##D # Use an auto.arima, ets, and tbats model with weights
##D # set by the MASE in-sample errors
##D mod2 <- hybridModel(AirPassengers, models = "aet",
##D weights = "insample.errors", errorMethod = "MASE")
##D 
##D # Pass additional arguments to auto.arima() to control its fit
##D mod3 <- hybridModel(AirPassengers, models = "aens",
##D a.args = list(max.p = 7, max.q = 7, approximation = FALSE))
##D 
##D # View the component auto.arima() and stlm() models
##D mod3$auto.arima
##D mod3$stlm
## End(Not run)




