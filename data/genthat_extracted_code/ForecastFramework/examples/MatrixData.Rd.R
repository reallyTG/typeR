library(ForecastFramework)


### Name: MatrixData
### Title: MatrixData
### Aliases: MatrixData

### ** Examples

SampleMatrixData <- R6Class(
  inherit = MatrixData,
  public = list(
    initialize = function(data){
      if('matrix' %in% class(data)){
        private$.mat = data
        private$.nrow = nrow(data)
        private$.ncol = ncol(data)
        private$.rnames = rownames(data)
        private$.cnames = colnames(data)
      }
    }
  )
)



