library(evtclass)


### Name: gevcTrain
### Title: GEV Classifier - training
### Aliases: gevcTrain

### ** Examples

trainset <- LETTER[1:15000,]
knowns <- trainset[trainset$class==1, -1]
gevClassifier <- gevcTrain(train = knowns)



