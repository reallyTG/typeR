library(ForecastFramework)


### Name: SimpleForecast
### Title: SimpleForecast
### Aliases: SimpleForecast

### ** Examples

data = IncidenceMatrix$new(matrix(1:9,3,3))
forecast = SimpleForecast$new(data,forecastTimes=c(FALSE,FALSE,TRUE))
forecast
forecast$forecastTimes
forecast$forecastMadeTime
forecast$data$mat
forecast$nsim
forecast$mean()$mat
forecast$median()$mat




