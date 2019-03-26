library(TSstudio)


### Name: test_forecast
### Title: Visualize of the Fitted and the Forecasted vs the Actual Values
### Aliases: test_forecast

### ** Examples

## Not run: 
##D library(forecast)
##D data(USgas)
##D 
##D # Set the horizon of the forecast
##D h <- 12
##D 
##D # split to training/testing partition
##D split_ts <- ts_split(USgas, sample.out  = h)
##D train <- split_ts$train
##D test <- split_ts$test
##D 
##D # Create forecast object
##D fc <- forecast(auto.arima(train, lambda = BoxCox.lambda(train)), h = h)
##D 
##D # Plot the fitted and forecasted vs the actual values
##D test_forecast(actual = USgas, forecast.obj = fc, test = test)
## End(Not run)



