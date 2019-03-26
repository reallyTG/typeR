library(nbc4va)


### Name: internalCheckNBC
### Title: Check arguments for nbc()
### Aliases: internalCheckNBC
### Keywords: internal

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Check train and test inputs, error if it does not pass check
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
checked <- nbc4va:::internalCheckNBC(train, test)
train <- checked$train
test <- checked$test




