library(RecordLinkage)


### Name: getMinimalTrain
### Title: Create a minimal training set
### Aliases: getMinimalTrain getMinimalTrain-methods
###   getMinimalTrain,RecLinkData-method getMinimalTrain,RLBigData-method
### Keywords: classif

### ** Examples

data(RLdata500)
p <- compare.dedup(RLdata500,blockfld=list(1,3),identity=identity.RLdata500)
train <- getMinimalTrain(p)
classif <- trainSupv(train,method="bagging")
summary(classifySupv(classif,newdata=p))



