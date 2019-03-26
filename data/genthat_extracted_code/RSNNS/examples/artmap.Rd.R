library(RSNNS)


### Name: artmap
### Title: Create and train an artmap network
### Aliases: artmap artmap.default

### ** Examples

## Not run: demo(artmap_letters)
## Not run: demo(artmap_lettersSnnsR)


data(snnsData)
trainData <- snnsData$artmap_train.pat
testData <- snnsData$artmap_test.pat

model <- artmap(trainData, nInputsTrain=70, nInputsTargets=5, 
                  nUnitsRecLayerTrain=50, nUnitsRecLayerTargets=26)
model$fitted.values

predict(model, testData)



