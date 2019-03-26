library(RSNNS)


### Name: normTrainingAndTestSet
### Title: Function to normalize training and test set
### Aliases: normTrainingAndTestSet

### ** Examples

data(iris)
#shuffle the vector
iris <- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]

irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])

iris <- splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)
normTrainingAndTestSet(iris)



