library(mlr)


### Name: calculateROCMeasures
### Title: Calculate receiver operator measures.
### Aliases: calculateROCMeasures print.ROCMeasures

### ** Examples

lrn = makeLearner("classif.rpart", predict.type = "prob")
fit = train(lrn, sonar.task)
pred = predict(fit, task = sonar.task)
calculateROCMeasures(pred)




