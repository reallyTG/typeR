library(performanceEstimation)


### Name: is.regression
### Title: Check if a certain predictive task is a regression problem
### Aliases: is.regression
### Keywords: models

### ** Examples


data(iris)
tsk <- PredTask(Species ~ .,iris)
if (!is.regression(tsk)) cat("This is not a regression task!\n")



