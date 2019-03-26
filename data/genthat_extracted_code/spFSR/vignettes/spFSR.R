## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----install1, eval = FALSE----------------------------------------------
#  install.packages("spFSR")

## ----dependencies, eval = FALSE------------------------------------------
#  if(!require("mlr") ){ install.packages("mlr") }                 # mlr (>= 2.11)
#  if(!require("parallelMap") ){ install.packages("parallelMap") } # parallelMap (>= 1.3)
#  if(!require("parallel") ){ install.packages("parallel")}        # parallel (>= 3.4.2)
#  if(!require("tictoc") ){ install.packages("tictoc") }           # tictoc (>= 1.0)
#  if(!require("ggplot2") ){ install.packages("ggplot2") }         # tictoc (>= 1.0)
#  

## ----install2, message = FALSE, eval = FALSE-----------------------------
#  if(!require('spFSR') ){
#    install.packages('spFSR_1.0.0.tar.gz', repos = NULL)
#  }

## ----iris, warning = FALSE-----------------------------------------------
data(iris)
head(iris)

## ----mlr-----------------------------------------------------------------
library(mlr)
knnWrapper    <- makeLearner("classif.knn", k = 5) 
classifTask   <- makeClassifTask(data = iris, target = "Species")
perf.measure  <- acc

## ----spsaoutput, warning = FALSE-----------------------------------------
library(spFSR)
set.seed(123)
spsaMod <- spFeatureSelection(
              task = classifTask,
              wrapper = knnWrapper,
              measure = perf.measure ,
              num.features.selected = 3,
              iters.max = 10,
              num.cores = 1)


## ----summary-------------------------------------------------------------
summary(spsaMod)

## ------------------------------------------------------------------------
plot(spsaMod, errorBar = TRUE)

## ----importance----------------------------------------------------------
getImportance(spsaMod)
plotImportance(spsaMod)

## ----getBestModel--------------------------------------------------------
bestMod <- getBestModel(spsaMod)

## ------------------------------------------------------------------------
class(bestMod)

## ----wrappedModel--------------------------------------------------------
# predict using the best mod
pred <- predict(bestMod, task = spsaMod$task.spfs )

# Obtain confusion matrix
calculateConfusionMatrix( pred )

## ---- message = FALSE----------------------------------------------------
if( !require(mlbench) ){install.packages('mlbench')}
library(mlbench)
data("BostonHousing")
head(BostonHousing)

## ------------------------------------------------------------------------
regTask    <- makeRegrTask(data = BostonHousing,  target = 'medv')
regWrapper <- makeLearner('regr.lm')

## ------------------------------------------------------------------------
regSPSA <- spFeatureSelection(
                task = regTask, wrapper = regWrapper,
                measure = mse, num.features.selected = 10,
                cv.stratify = FALSE,
                iters.max = 10,
                num.cores = 1
              )


## ------------------------------------------------------------------------
summary(regSPSA)
getImportance(regSPSA)
plotImportance(regSPSA)

## ------------------------------------------------------------------------
bestRegMod <- getBestModel(regSPSA)
predData   <- predict(bestRegMod, task = regSPSA$task.spfs) # obtain the prediction

