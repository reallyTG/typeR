library(ForecastFramework)


### Name: DataContainer
### Title: DataContainer
### Aliases: DataContainer

### ** Examples

SampleDataContainer <- R6Class(
  inherit= DataContainer,
  public = list(
    initialize = function(...){
      self$metaData = list(...)
    }
  )
)
data <- SampleDataContainer$new(letters[1:10],1:10)
data
data$metaData



