library(ForecastFramework)


### Name: FrameData
### Title: FrameData
### Aliases: FrameData

### ** Examples

SampleFrameData <- R6Class(
  inherit = FrameData,
  public = list(
    initialize = function(data){
      private$.frame = data
      private$.arr = data
      private$.mat = data
      private$.dims = dim(data)
      private$.ndim = length(private$.dims)
      private$.dnames = dimnames(data)
    }
  )
)



