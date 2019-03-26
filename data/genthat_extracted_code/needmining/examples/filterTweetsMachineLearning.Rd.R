library(needmining)


### Name: filterTweetsMachineLearning
### Title: Classify needs based on machine learning
### Aliases: filterTweetsMachineLearning

### ** Examples

data(NMTrainingData)
data(NMdataToClassify)
smallNMTrainingData <- rbind(NMTrainingData[1:75,], NMTrainingData[101:175,])
smallNMdataToClassify <- rbind(NMdataToClassify[1:10,], NMdataToClassify[101:110,])
results <- filterTweetsMachineLearning(smallNMdataToClassify, smallNMTrainingData)




