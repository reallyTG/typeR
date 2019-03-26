library(ForecastFramework)


### Name: RelationalData
### Title: RelationalData
### Aliases: RelationalData

### ** Examples

require(dplyr)
require(reshape2)
require(R.utils)
SampleRelationalTables <- R6Class(
  inherit = AbstractRelationalTables,
  public = list(
    initialize = function(...){
      private$.tables = list(...)
      if(!all(sapply(private$.tables,function(x){is.data.frame(x)}))){
        stop("All arguments must be data frames")
      }
    },
    updateFrame = function(){
      private$.frame = Reduce(x = private$.tables,f = left_join)
    },
    updateArray = function(){
      val <- names(self$frame)[1]
      dims <- names(self$frame[2:ncol(self$frame)])
      private$.arr <- self$frame %>%
        group_by_(.dots=setNames(dims,NULL)) %>%
        summarize_all(sum) %>% 
        ungroup() %>%
        acast(as.formula(paste(dims,collapse='~')),value.var=val)
      mode(private$.arr) = 'numeric'
      private$.dims = dim(private$.arr)
      private$.nrow = private$.dims[1]
      private$.ncol = private$.dims[2]
      private$.ndim = length(private$.dims)
      private$.dnames = dimnames(private$.arr)
    }
  ),
  active = list(
    mat = function(value){
      if(self$ndim <= 2){
        return(self$arr)
      }
      return(extract(private$.arr,indices = rep(self$ndim-2,x=1),dims = 3:self$ndim,drop=TRUE))
    }
  )
)



