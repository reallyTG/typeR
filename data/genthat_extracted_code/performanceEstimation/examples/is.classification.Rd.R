library(performanceEstimation)


### Name: is.classification
### Title: Check if a certain predictive task is a classification problem
### Aliases: is.classification
### Keywords: models

### ** Examples

data(iris)
tsk <- PredTask(Species ~ .,iris)
if (is.classification(tsk)) cat("This is a classification task.\n")



