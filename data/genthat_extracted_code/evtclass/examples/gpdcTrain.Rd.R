library(evtclass)


### Name: gpdcTrain
### Title: GPD Classifier - training
### Aliases: gpdcTrain

### ** Examples

trainset <- LETTER[1:15000,]
knowns <- trainset[trainset$class==1, -1]
gpdClassifier <- gpdcTrain(train = knowns, k = 10)



