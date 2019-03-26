library(evtclass)


### Name: gpdcTest
### Title: GPD Classifier - testing
### Aliases: gpdcTest

### ** Examples

trainset <- LETTER[1:15000,]
testset <- LETTER[-(1:15000), -1]
knowns <- trainset[trainset$class==1, -1]
gpdClassifier <- gpdcTrain(train = knowns, k = 10)
predicted <- gpdcTest(train = knowns, test = testset, pre = gpdClassifier)



