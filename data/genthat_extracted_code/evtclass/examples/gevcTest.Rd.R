library(evtclass)


### Name: gevcTest
### Title: GEV Classifier - testing
### Aliases: gevcTest

### ** Examples

trainset <- LETTER[1:15000,]
testset <- LETTER[-(1:15000), -1]
knowns <- trainset[trainset$class==1, -1]
gevClassifier <- gevcTrain(train = knowns)
predicted <- gevcTest(train = knowns, test = testset, pre = gevClassifier)



