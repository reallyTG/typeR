library(performanceEstimation)


### Name: EstimationTask-class
### Title: Class '"EstimationTask"'
### Aliases: EstimationTask EstimationTask-class show,EstimationTask-method
### Keywords: classes

### ** Examples

showClass("EstimationTask")

## Estimating Mean Squared Error using 10-fold cross validation
et <- EstimationTask(metrics="mse")
et

## Estimating Accuracy and Total Time (train+test times) using 3
## repetitions of holdout with 20% of the cases used for testing. 
EstimationTask(metrics=c("acc","totTime"),method=Holdout(nReps=3,hldSz=0.2))

## An example with a user-defined metric: the average differences between true
## predicted values raised to a certain power.

## First we define the function that calculates this metric. It
## needs to have 'trues' and 'preds' as the first two arguments if we
## want it to be usable by standard workflows
powErr <- function(trues,preds,metrics,pow=3) {
     if (metrics != "pow.err") stop("Unable to calculate that metric!")
     c(pow.err = mean((trues-preds)^pow))
}

## Now the estimation task (10-fold cv in this example)
EstimationTask(metrics="pow.err", method=CV(), 
               evaluator="powErr", evaluator.pars=list(pow=4))



