library(mlr)


### Name: generateFeatureImportanceData
### Title: Generate feature importance.
### Aliases: generateFeatureImportanceData FeatureImportanceData

### ** Examples


lrn = makeLearner("classif.rpart", predict.type = "prob")
fit = train(lrn, iris.task)
imp = generateFeatureImportanceData(iris.task, "permutation.importance",
  lrn, "Petal.Width", nmc = 10L, local = TRUE)




