library(ForecastFramework)


### Name: AbstractIncidenceArray
### Title: AbstractIncidenceArray
### Aliases: AbstractIncidenceArray

### ** Examples

require(abind)
SampleIncidenceArray  <- R6Class(
  inherit= AbstractIncidenceArray,
  public = list(
    initialize = function(data,dims = dim(data),dnames,dimData,metaData){
      private$.arr <- array(data,dims)
      if(!missing(dnames)){
        dimnames(private$.arr) <- dnames
        private$.dnames <- dnames
      }
      private$.dims = dim(data)
      private$.ndim = length(dim(data))
      if(!missing(dimData)){
        self$dimData <- dimData
      } else {
        self$dimData <- rep(list(list()),self$ndim)
      }
      if(!missing(metaData)){
        self$metaData <- metaData
      }
    },
    addSlices = function(number,dimension,mutate=TRUE){
      if(!mutate){
        return(self$clone(TRUE)$addSlices(number,dimension))
      }
      dims <- private$.dims
      dims[dimension] <- number
      private$.arr <-
        abind(
          private$.arr,
          array(NA,dims),
          along=dimension
        )
      private$.dims = dim(private$.arr)
      private$.dnames = dimnames(private$.arr)
    },
    subset = function(...,mutate=TRUE){
      if(!mutate){
        return(self$clone(TRUE)$subset(number,dimension))
      }
      private$.arr = private$.arr[...]
      private$.dnames = dimnames(private$.arr)
      private$.dims = dim(private$.arr)
      self$dimData <- 
        mapply(
          index = list(...),
          obj = self$dimData,
          function(index,obj){
            lapply(obj,function(x){x[index]})
          },
          SIMPLIFY = FALSE
        )
    }
  )
)

data = SampleIncidenceArray$new(array(1:27,c(3,3,3)))
data$addSlices(1,1)
data$addSlices(2,2)
data$addSlices(3,3)
data$arr
data$dims
data$subset(1:2,1:2,1:2)



