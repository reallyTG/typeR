library(ePCR)


### Name: cv
### Title: Function that creates customized cross-validation folds
### Aliases: cv

### ** Examples

data(TYKSSIMU)
cvfolds <- cv(x = xMEDISIMU, fold = 3)
cvfolds$train
cvfolds$test



