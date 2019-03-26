library(MXM)


### Name: Ridge regression
### Title: Ridge regression
### Aliases: ridge.reg
### Keywords: Ridge regression

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(100 * 50, 1, 100), nrow = 100 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 10]
dataset <- dataset[, -10]
a0 <- ridge.reg(target, dataset, lambda = 0, B = 1, newdata = NULL)
a1 <- ridge.reg(target, dataset, lambda = 0.5, B = 1, newdata = NULL)
a2 <- ridge.reg(target, dataset, lambda = 0.5, B = 100, newdata = NULL) 



