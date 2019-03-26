library(MXM)


### Name: Cross-validation for ridge regression
### Title: Cross validation for the ridge regression
### Aliases: ridgereg.cv
### Keywords: Ridge regression

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(200 * 50, 1, 100), nrow = 200 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 50]
a1 <- ridgereg.cv(target, dataset, auto = TRUE)
a2 <- ridgereg.cv( target, dataset, K = 10, lambda = seq(0, 1, by = 0.1) )



