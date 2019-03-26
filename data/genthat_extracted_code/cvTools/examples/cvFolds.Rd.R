library(cvTools)


### Name: cvFolds
### Title: Cross-validation folds
### Aliases: cvFolds print.cvFolds
### Keywords: utilities

### ** Examples

set.seed(1234)  # set seed for reproducibility
cvFolds(20, K = 5, type = "random")
cvFolds(20, K = 5, type = "consecutive")
cvFolds(20, K = 5, type = "interleaved")
cvFolds(20, K = 5, R = 10)



