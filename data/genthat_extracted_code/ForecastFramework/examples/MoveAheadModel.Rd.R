library(ForecastFramework)


### Name: MoveAheadModel
### Title: MoveAheadModel
### Aliases: MoveAheadModel

### ** Examples

MoveAheadModel <- R6Class(
  classname = 'MoveAheadModel',
  inherit = RecursiveForecastModel,
  private = list(
    .data = IncidenceMatrix$new(),
    newdata = IncidenceMatrix$new(),
    output = ArrayData$new(),
  	.nsim = 3,
    .predCols = c(as.integer(1)),
    .maxPredCol = as.integer(1)
  ),
  public = list(
    initialize = function(nsim = 3){
      private$.nsim = nsim
    },
    fit_ = function(){
      if(self$data$ncol <= self$predCols){
        stop("We cannot go further back than the start of the matrix.")
      }
    },
    predictRow_ = function(row,col=0){
      predict_(col)
    },
    predict_ = function(col=0){
      if('predict_' %in% private$.debug){
        browser()
      }
      if(col == 0){
        col=1:private$output$ncol
      }
      private$output$mutate(
        cols=col,
        data = SimulatedIncidenceMatrix$new(
          private$newdata,
          private$.nsim
        )$simulations
      )
    },
    prepareFitData = function(data){
      private$.data = data$clone(TRUE)
    },
    preparePredictData = function(newdata){
      if('preparePredictData' %in% private$.debug){
        browser()
      }
      private$newdata = SimulatedIncidenceMatrix$new(data=newdata,nsim=self$nsim)
      private$.nrow = private$newdata$nrow
      private$newdata$addColumns(min(self$predCols))
      private$newdata$lag(min(self$predCols),na.rm=FALSE)
      private$newdata$subset(cols=2:private$newdata$ncol)
    },
    prepareForecastData = function(data){
      if(self$data$ncol <= self$predCols){
        stop("We cannot go further back than the start of the matrix.")
      }
      private$newdata = data$clone(TRUE)
      private$.nrow = private$newdata$nrow
      private$newdata$addColumns(min(self$predCols))
      private$newdata$lag(min(self$predCols),na.rm=TRUE)
    },
    prepareOutputData = function(inputData,steps=0){
      private$output = SimulatedIncidenceMatrix$new(inputData,private$.nsim)
      if(steps > 0){
        private$output$addColumns(steps)
      }
    }
  ),
  active = list(
    nsim = function(value){
      private$defaultActive(type='private',name='.nsim',val=value)
    }
  )
)



