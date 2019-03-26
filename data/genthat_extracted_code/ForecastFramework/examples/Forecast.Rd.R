library(ForecastFramework)


### Name: Forecast
### Title: Forecast
### Aliases: Forecast

### ** Examples



SimpleForecast <- R6Class(
  classname = "SimpleForecast",
  inherit = Forecast,
  private = list(
    .data = MatrixData$new()
  ),
  public = list(
    binDist = function(cutoffs){
      stop("This doesn't really make sense.")
    },
    mean = function(){
      return(self$data)
    },
    median = function(){
      return(self$data)
    },
    quantile = function(alphas){
      stop("This doesn't really make sense.")
    },
    initialize = function(data,forecastTimes){
    	if(missing(data) && missing(forecastTimes)){
    		return()
    	}
      if(data$ncol != length(forecastTimes)){
        stop("The number of columns should be the number of times forecasted.")
      }
      private$.forecastMadeTime = now()
      private$.forecastTimes = forecastTimes
      private$.data = data
    }
  ),
  active = list(
  )
)



