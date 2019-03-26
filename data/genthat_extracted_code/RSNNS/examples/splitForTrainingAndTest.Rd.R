library(RSNNS)


### Name: splitForTrainingAndTest
### Title: Function to split data into training and test set
### Aliases: splitForTrainingAndTest

### ** Examples

data(iris)
#shuffle the vector
iris <- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]

irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])

splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)



