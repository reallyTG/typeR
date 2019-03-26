library(MXM)


### Name: Regression modeler
### Title: Generic regression modelling function
### Aliases: modeler
### Keywords: Regression model

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(100 * 10, 1, 100), nrow = 100 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 1]
dataset <- dataset[, -1]
a <- modeler(target, dataset)



