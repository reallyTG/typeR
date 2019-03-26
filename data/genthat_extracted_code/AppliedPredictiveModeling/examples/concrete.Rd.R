library(AppliedPredictiveModeling)


### Name: concrete
### Title: Compressive Strength of Concrete from Yeh (1998)
### Aliases: concrete mixtures
### Keywords: datasets

### ** Examples

data(concrete)

library(caret)

### Split used in the book:
set.seed(975)
inTrain <- createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training <- mixtures[ inTrain,]
testing  <- mixtures[-inTrain,]




