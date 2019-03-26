library(caret)


### Name: bagFDA
### Title: Bagged FDA
### Aliases: bagFDA print.bagFDA bagFDA.default bagFDA.formula
### Keywords: regression

### ** Examples

library(mlbench)
library(earth)
data(Glass)

set.seed(36)
inTrain <- sample(1:dim(Glass)[1], 150)

trainData <- Glass[ inTrain, ]
testData  <- Glass[-inTrain, ]


set.seed(3577)
baggedFit <- bagFDA(Type ~ ., trainData)
confusionMatrix(data = predict(baggedFit, testData[, -10]),
                reference = testData[, 10])




