library(mlr)


### Name: plotCalibration
### Title: Plot calibration data using ggplot2.
### Aliases: plotCalibration

### ** Examples

## Not run: 
##D lrns = list(makeLearner("classif.rpart", predict.type = "prob"),
##D             makeLearner("classif.nnet", predict.type = "prob"))
##D fit = lapply(lrns, train, task = iris.task)
##D pred = lapply(fit, predict, task = iris.task)
##D names(pred) = c("rpart", "nnet")
##D out = generateCalibrationData(pred, groups = 3)
##D plotCalibration(out)
##D 
##D fit = lapply(lrns, train, task = sonar.task)
##D pred = lapply(fit, predict, task = sonar.task)
##D names(pred) = c("rpart", "lda")
##D out = generateCalibrationData(pred)
##D plotCalibration(out)
## End(Not run)



