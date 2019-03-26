library(ForecastFramework)


### Name: ArrayData
### Title: ArrayData
### Aliases: ArrayData

### ** Examples

SampleArrayData <- R6Class(
  inherit = ArrayData,
  public = list(
    initialize = function(data){
      if('array' %in% class(data)){
        private$.arr = data
        private$.dims = dim(data)
        private$.ndim = length(private$.dim)
        private$.dnames = dimnames(data)
      }
    }
  )
)



