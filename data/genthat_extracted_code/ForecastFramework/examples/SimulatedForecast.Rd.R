library(ForecastFramework)


### Name: SimulatedForecast
### Title: SimulatedForecast
### Aliases: SimulatedForecast

### ** Examples



IncidenceForecast <- R6Class(
  classname = "IncidenceForecast",
  inherit = SimulatedForecast,
  private = list(
    .data = AbstractSimulatedIncidenceMatrix$new()
  ),
  public = list(
    initialize = function(data=SimulatedIncidenceMatrix$new(),forecastTimes=c()){
      if(data$ncol != length(forecastTimes)){
        stop("The number of columns should be the number of times forecasted.")
      }
      private$.forecastMadeTime = now()
      private$.forecastTimes = forecastTimes
      private$.data = data
    }
  ),
  active = list(
    data = function(value){
      private$defaultActive(".data","private",value)
    }
  )
)




