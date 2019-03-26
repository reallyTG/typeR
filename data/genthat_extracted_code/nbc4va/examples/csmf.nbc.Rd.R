library(nbc4va)


### Name: csmf.nbc
### Title: Calculate predicted CSMFs from a NBC model
### Aliases: csmf.nbc

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Obtain the predicted CSMFs
predCSMF <- csmf.nbc(results)




