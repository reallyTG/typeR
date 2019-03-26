library(performanceEstimation)


### Name: responseValues
### Title: Obtain the target variable values of a prediction task
### Aliases: responseValues
### Keywords: models

### ** Examples

data(iris)
tgt <- responseValues(Species ~ ., iris)
summary(tgt)



