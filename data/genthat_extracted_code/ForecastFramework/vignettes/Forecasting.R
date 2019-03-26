## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----Outline,eval=FALSE--------------------------------------------------
#    public = list(
#      #' @method fit_ Get the model ready to predict
#      #' @param data The data to fit the model to.
#      fit = function(data){
#        ...
#      },
#      #' @method forecast Predict some number of time steps into the future.
#      #' @param newdata The data to forecast from
#      #' @param steps The number of timesteps into the future to predict.
#      forecast = function(newdata,steps){
#        ...
#      },
#      #' @method initialize Create a new instance of this class.
#      initialize = function(){
#        ...
#      },
#      #' @method predict predict using the model.
#      #' @param newdata Predict using the model.
#      predict = function(newdata){
#        ...
#      },
#    )

## ------------------------------------------------------------------------
library(DAAG)
data("bomregions")
data_matrix = t(bomregions[,10:17])
colnames(data_matrix) = bomregions[,1]
data_matrix[,101:109]
data_matrix = IncidenceMatrix$new(data_matrix)

## ----fit , eval=FALSE----------------------------------------------------
#  #' @method fit_ Get the model ready to predict
#      #' @param data The data to fit the model to.
#      fit = function(data=self$data){
#        private$.data = IncidenceMatrix$new(data)
#        highestRegion = matrix(
#          which(apply(self$data$mat,2,function(x){x==max(x)})) %% self$data$nrow,
#          1,
#          self$data$ncol,
#          dimnames = list('y',NULL)
#        )
#        self$data$lag(c(self$windowSize + 1:self$windowStart))
#        eqn = formula(paste('y',paste(self$data$rnames,collapse=' + '),sep=' ~ '))
#        self$data$addRows(1)
#        self$data$mutate(row=self$data$nrow,data=highestRegion)
#        private$.model = glm(eqn,data = as.data.frame(t(self$data$mat)))
#      }

## ----forecast , eval=FALSE-----------------------------------------------
#      #' @method forecast Predict some number of time steps into the future.
#      #' @param newdata The data to forecast from
#      #' @param steps The number of timesteps into the future to predict.
#      forecast = function(newdata,steps){
#        private$.newdata = IncidenceMatrix$new(newdata)
#        if(steps > self$windowStart){
#          stop("Model needs to be fit differently to forecast this far ahead.")
#        }
#        self$newdata$addColumns(steps)
#        self$newdata$lag(c(self$windowSize + 1:self$windowStart))
#        self$newdata$tail(k=steps,direction=2)
#        output = IncidenceMatrix$new(matrix(
#          round(predict(self$model,newdata=as.data.frame(t(self$newdata$mat)))),
#          1,
#          steps
#        ))
#  
#        SimpleForecast$new(
#          data=output,
#          forecastTimes = rep(TRUE,steps)
#        )
#      }

## ----predict , eval=FALSE------------------------------------------------
#      #' @method predict predict using the model.
#      #' @param newdata Predict using the model.
#      predict = function(newdata = private$.newdata){
#        self$forecast(newdata,1)
#      }

## ----initialize , eval=FALSE---------------------------------------------
#      #' @method initialize Create a new instance of this class.
#      #' @param windowSize How many different time steps to use when forecasting.
#      #' @param windowStart How far back to start forecasting.
#      initialize = function(windowSize = 3,windowStart = 3 ){
#        self$windowSize = windowSize
#        self$windowStart = windowStart
#      }

## ----Full Model----------------------------------------------------------
MaximumRegionForecastModel <- R6Class(
  inherit=ForecastModel,
  private = list(
    .data = MatrixData$new(),
    .newdata = MatrixData$new(),
    .model = "glm",
    .windowSize = 3,
    .windowStart = 3
  ),
  public = list(
    #' @method fit_ Get the model ready to predict
    #' @param data The data to fit the model to.
    fit = function(data=self$data){
      private$.data = IncidenceMatrix$new(data)
      highestRegion = matrix(
        which(apply(self$data$mat,2,function(x){x==max(x)})) %% self$data$nrow,
        1,
        self$data$ncol,
        dimnames = list('y',NULL)
      )
      self$data$lag(c(self$windowSize + 1:self$windowStart))
      eqn = formula(paste('y',paste(self$data$rnames,collapse=' + '),sep=' ~ '))
      self$data$addRows(1)
      self$data$mutate(row=self$data$nrow,data=highestRegion)
      private$.model = glm(eqn,data = as.data.frame(t(self$data$mat)))
    },
    #' @method forecast Predict some number of time steps into the future.
    #' @param newdata The data to forecast from
    #' @param steps The number of timesteps into the future to predict.
    forecast = function(newdata,steps){
      private$.newdata = newdata
      if(steps > self$windowStart){
        stop("Model needs to be fit differently to forecast this far ahead.")
      }
      self$newdata$addColumns(steps)
      self$newdata$lag(c(self$windowSize + 1:self$windowStart))
      self$newdata$tail(k=steps,direction=2)
      output = IncidenceMatrix$new(matrix(
        round(predict(self$model,newdata=as.data.frame(t(self$newdata$mat)))),
        1,
        steps
      ))
      
      SimpleForecast$new(
        data=output,
        forecastTimes = rep(TRUE,steps)
      )
    },
    #' @method initialize Create a new instance of this class. 
    #' @param windowSize How many different time steps to use when forecasting.
    #' @param windowStart How far back to start forecasting.
    initialize = function(windowSize = 3,windowStart = 3 ){
      self$windowSize = windowSize
      self$windowStart = windowStart
    },
    #' @method predict predict using the model.
    #' @param newdata Predict using the model.
    predict = function(newdata = private$.newdata){
      self$forecast(newdata,1)
    }
  ),
  active = list(
    data = function(value){
      if(missing(value)){
        return(private$.data)
      } else{
        stop("Do not write directly to the data.  Fit the model instead.")
      }
    },
    newdata = function(value){
      if(missing(value)){
        return(private$.newdata)
      } else{
        stop("Do not write directly to the data.  Fit the model instead.")
      }
    },
    model = function(value){
      if(missing(value)){
        return(private$.model)
      } else{
        stop("Do not write directly to the model  Fit the model instead.")
      }
    },
    windowSize = function(value){
      private$defaultActive(type='private',name='.windowSize',value=value)
    },
    windowStart = function(value){
      private$defaultActive(type='private',name='.windowSize',value=value)
    }
  )
)

## ----Evaluation----------------------------------------------------------
RainForecaster = MaximumRegionForecastModel$new()
RainForecaster$fit(data_matrix)
data_matrix$rnames[RainForecaster$forecast(data_matrix,3)$data$mat]

