library(ForecastFramework)


### Name: Model
### Title: Model
### Aliases: Model

### ** Examples

SampleModel <- R6Class(
  inherit = Model,
  private = list(
    data = MatrixData$new(),
    model = NULL  ),
  public = list(
    fit = function(data){
      private$data = IncidenceMatrix$new(data)
      private$model =
        glm(
          as.formula("y ~ x"),
          data = data.frame(
            y=as.numeric(private$data$mat),
            x=as.numeric(private$data$lag(1,mutate=FALSE)$mat)
          )
        )
    },
    predict = function(newdata){
      private$output = private$data$clone(TRUE)
      forecastTimes = rep(FALSE,private$output$ncol)
      private$output$addColumns(1)
      forecastTimes = c(forecastTimes,TRUE)
      private$output$mutate(
        cols = private$output$ncol,
        data=predict(
          private$model,
          newdata = data.frame(
            x=private$output$mat[,private$output$ncol-1]
          )
        )
      )
      return(SimpleForecast$new(private$output,forecastTimes))
    },
    initialize = function(...){
    }
  )
)



