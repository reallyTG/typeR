library(ForecastFramework)


### Name: IncidenceForecast
### Title: IncidenceForecast
### Aliases: IncidenceForecast

### ** Examples

data = SimulatedIncidenceMatrix$new(
  IncidenceMatrix$new(matrix(1:9,3,3)),
  nsim=3
)
data$addError(cols = 3,type='Poisson')
forecast = IncidenceForecast$new(data,forecastTimes=c(FALSE,FALSE,TRUE))
forecast
forecast$forecastTimes
forecast$forecastMadeTime
forecast$data$mat
forecast$nsim
forecast$sample$mat
forecast$sample$mat
forecast$mean()$mat
forecast$median()$mat
forecast$binDist(1:4*4)$arr
forecast$quantile(c(.05,.5,.95))$arr



