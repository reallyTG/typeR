library(TSstudio)


### Name: ts_backtesting
### Title: Evaluation Function for Forecasting Models
### Aliases: ts_backtesting

### ** Examples

## Not run: 
##D data(USgas)
##D USgas_backtesting <- ts_backtesting(USgas, 
##D                                     periods = 6, 
##D                                     window_size = 24, 
##D                                     h = 60, 
##D                                     error = "RMSE")
##D 
##D # Selecting a specific models (auto.arima, ets and nnetar)
##D USgas_backtesting <- ts_backtesting(USgas, 
##D                                     models = "aen", 
##D                                     periods = 6, 
##D                                     window_size = 24, 
##D                                     h = 60)
##D  
##D # Retrieve the models leaderboard
##D USgas_backtesting$leaderboard
##D 
##D 
##D # Retrieve the best forecast results
##D USgas_backtesting$leadForecast$mean
##D 
##D # Retrieve the final forecast of the ets model
##D USgas_backtesting$Forecast_Final$ets$mean
##D 
##D # Retrieve the ets forecast during the first period of testing
##D USgas_backtesting$period_1$ets$forecast$mean
##D 
##D # Get the final plot of the models performance and the selected forecasting model
##D USgas_backtesting$summary_plot
## End(Not run)



