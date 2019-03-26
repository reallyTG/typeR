library(MXM)


### Name: Generate random folds for cross-validation
### Title: Generate random folds for cross-validation
### Aliases: generatefolds
### Keywords: Generation of folds

### ** Examples

a <- generatefolds(iris[, 5], nfolds = 5, stratified = TRUE)
table(iris[a[[1]], 5])  ## 10 values from each group



