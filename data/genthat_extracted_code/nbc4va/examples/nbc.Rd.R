library(nbc4va)


### Name: nbc
### Title: Train a NBC model
### Aliases: nbc

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
# Set "known" to indicate whether or not "test" causes are known
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test, known=TRUE)

# Obtain the probabilities and predictions
prob <- results$prob.causes
pred <- results$pred.causes




