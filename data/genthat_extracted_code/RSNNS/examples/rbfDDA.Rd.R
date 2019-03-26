library(RSNNS)


### Name: rbfDDA
### Title: Create and train an RBF network with the DDA algorithm
### Aliases: rbfDDA rbfDDA.default

### ** Examples

## Not run: demo(iris)
## Not run: demo(rbfDDA_spiralsSnnsR)


data(iris)
iris <- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]
irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])
iris <- splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)
iris <- normTrainingAndTestSet(iris)

model <- rbfDDA(iris$inputsTrain, iris$targetsTrain)

summary(model)
plotIterativeError(model)



