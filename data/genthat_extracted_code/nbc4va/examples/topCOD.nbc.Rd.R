library(nbc4va)


### Name: topCOD.nbc
### Title: Cause of death predictions from a NBC model
### Aliases: topCOD.nbc

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Obtain the top cause of death predictions for the test data
topPreds <- topCOD.nbc(results)




