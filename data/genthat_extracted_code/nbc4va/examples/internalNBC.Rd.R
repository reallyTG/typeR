library(nbc4va)


### Name: internalNBC
### Title: NBC algorithm source code
### Aliases: internalNBC
### Keywords: internal

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Create naive bayes classifier on random train and test data
# Set "known" to indicate whether or not "test" causes are known
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc4va:::internalNBC(train, test, known=TRUE)

# Obtain the probabilities and predictions
prob <- results$prob.causes
pred <- results$pred.causes




