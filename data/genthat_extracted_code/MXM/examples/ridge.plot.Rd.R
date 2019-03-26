library(MXM)


### Name: Ridge regression coefficients plot
### Title: Ridge regression
### Aliases: ridge.plot
### Keywords: Ridge regression

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(300 * 20, 1, 20), nrow = 300 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 20]
dataset <- dataset[, -20]
ridge.plot(target, dataset)



