## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(DAAG)

## ----data----------------------------------------------------------------
library(DAAG)
data("bomregions")
matrix_data = t(bomregions[1:8,c(10:17)])
colnames(matrix_data) = bomregions[1:8,1]
matrix_data

## ----IncidenceMatrix-----------------------------------------------------
SpaceTimeMatrix <- IncidenceMatrix$new(data=matrix_data)

## ----Model 1,eval=FALSE--------------------------------------------------
#  MovingAverageModel <- R6Class(
#  	inherit = Model,

## ----Model 2,eval=FALSE--------------------------------------------------
#    private = list(
#      window = NA,
#      windowSize = 0
#    )

## ----Model 3,eval=FALSE--------------------------------------------------
#  	public = list(

## ----Model 4,eval=FALSE--------------------------------------------------
#  		#' @method initialize Create a new Moving Average Model
#  		#' @param windowSize The size of window over which to do the moving average
#  		initialize = function(windowSize = 1){
#  			private$window = as.integer(1:windowSize)
#  			private$windowSize = as.integer(windowSize)
#  	  }

## ----Model 5 ,eval=FALSE-------------------------------------------------
#      #' @method fit This function does nothing.
#      #' @param data This is included for compliance with Model.R
#      fit = function(data){
#        #The model is always fitted
#        return()
#      },

## ----Model 6,eval=FALSE--------------------------------------------------
#  		#' @method predict Predict as much as possible from the new data
#  		#' @param newdata The data to use when making predictions.
#  		predict = function(newdata){
#  		  if(!('MatrixData' %in% class(newdata))){
#  		    stop("This operation requires matrix-like data")
#  		  }
#  		  # for debugging: see AbstractClasses::Generic::debug for details.
#  		  if('predict' %in% private$.debug){
#  		    browser()
#  		  }
#  		  #This is an R6 specific thing.  We want to clone arguments before we use them, because
#  		  #  otherwise we will also modify the original.
#  		  newdata = newdata$clone(TRUE)
#  		  #We'll add a column so the lagging works out correctly.
#  		  #We can think of this as adding the prediction column to the data.
#  		  newdata$addColumns(1)
#  		  #We pre-allocate our return as another as a subclass of the Forecast class.
#  		  #SimulatedIncidenceMatrix is the only one currently defined, so...
#  		  #We're not doing anything stochastic, so we set the number of simulations to 1.
#  		  rc = SimulatedIncidenceMatrix$new(newdata,nsim=1)
#  		  #First we use the lag function of IncidenceMatrix to reogranize the data.
#  		  #We want to use every row at every time step in the window.  The lag function allows us
#  		  #to create new rows for these previous time steps.
#  		  newdata$lag(private$window)
#  		  #Since we added new rows, in particular for each old row we added private$windowSize new rows
#  		  #  we divide.
#  		  for(row in 1:newdata$nrow/private$windowSize){
#  		    #The seq call is the index of all rows corresponding to the original row `row`
#  		    #In other words, we take the mean of all rows corresponding to lagged versions of the original row
#  		    #2 means take the mean of each column
#  		    rc$mutate(rows=row,data=apply(newdata$mat[seq(row,newdata$nrow,private$windowSize),],2,mean))
#  		  }
#  		  return(IncidenceForecast$new(data=rc))
#  		}

## ----Model Full,echo=TRUE------------------------------------------------
MovingAverageModel <- R6Class(
	classname = "MovingAverageModel",
	inherit = Model,
	private = list(
    window = NA,
    windowSize = 0
  ),
	public = list(
		initialize = function(windowSize = 1){
			private$window = as.integer(1:windowSize)
			private$windowSize = as.integer(windowSize)
	  },
		#' @method fit This function does nothing.
    #' @param data This is included for compliance with Model.R
		fit = function(data){
      #This model is always fitted.
      return()
    },
		#' @method predict Predict as much as possible from the new data
		#' @param newdata The data to use when making predictions.
		predict = function(newdata){
		  if(!('MatrixData' %in% class(newdata))){
		    stop("This operation requires matrix-like data")
		  }
		  # for debugging: see AbstractClasses::Generic::debug for details.
		  if('predict' %in% private$.debug){
		    browser()
		  }
		  #We'll add a column so the lagging works out correctly.
		  #We can think of this as adding the prediction column to the data.
		  newdata$addColumns(1)
		  #We pre-allocate our return as another as a subclass of the Forecast class.
		  #SimulatedIncidenceMatrix is the only one currently defined, so...
		  #We're not doing anything stochastic, so we set the number of simulations to 1.
		  rc = SimulatedIncidenceMatrix$new(newdata,nsim=1)
		  #First we use the lag function of IncidenceMatrix to reogranize the data.
		  #We want to use every row at every time step in the window.  The lag function allows us
		  #to create new rows for these previous time steps.
		  newdata$lag(private$window)
		  #Since we added new rows, in particular for each old row we added private$windowSize new rows
		  #  we divide.
		  for(row in 1:newdata$nrow/private$windowSize){
		    #The seq call is the index of all rows corresponding to the original row `row`
		    #In other words, we take the mean of all rows corresponding to lagged versions of the original row
		    #2 means take the mean of each column
		    rc$mutate(rows=row,data=apply(newdata$mat[seq(row,newdata$nrow,private$windowSize),],2,mean))
		  }
		  return(IncidenceForecast$new(data=rc,forecastTimes=sapply(1:rc$ncol,function(x){return(TRUE)})))
		}
	)
)

## ----Prediction, warning = FALSE-----------------------------------------
TheModel <- MovingAverageModel$new(windowSize=3)
 TheModel$fit(data=SpaceTimeMatrix$subset(cols=-SpaceTimeMatrix$ncol,mutate=FALSE))
 TheModel$predict(newdata=SpaceTimeMatrix$subset(cols=-SpaceTimeMatrix$ncol,mutate=FALSE))$mean()$mat

## ----stuff, warning=FALSE------------------------------------------------
prediction <- TheModel$predict(newdata=SpaceTimeMatrix$subset(cols=-SpaceTimeMatrix$ncol,mutate=FALSE))
prediction

## ----Error, warning=FALSE------------------------------------------------
truth <- SpaceTimeMatrix
abs_error <- abs(prediction$mean()$mat-truth$mat)
abs_error

