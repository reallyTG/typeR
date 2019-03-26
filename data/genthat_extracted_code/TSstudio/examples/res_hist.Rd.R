library(TSstudio)


### Name: res_hist
### Title: Histogram Plot of the Residuals Values
### Aliases: res_hist

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
##D res_hist(forecast.obj = fc)
## End(Not run)



