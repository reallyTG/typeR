library(mlr)


### Name: makeClassificationViaRegressionWrapper
### Title: Classification via regression wrapper.
### Aliases: makeClassificationViaRegressionWrapper

### ** Examples

lrn = makeLearner("regr.rpart")
lrn = makeClassificationViaRegressionWrapper(lrn)
mod = train(lrn, sonar.task, subset = 1:140)
predictions = predict(mod, newdata = getTaskData(sonar.task)[141:208, 1:60])



