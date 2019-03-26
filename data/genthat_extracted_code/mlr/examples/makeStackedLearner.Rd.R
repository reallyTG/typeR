library(mlr)


### Name: makeStackedLearner
### Title: Create a stacked learner object.
### Aliases: makeStackedLearner

### ** Examples

  # Classification
  data(iris)
  tsk = makeClassifTask(data = iris, target = "Species")
  base = c("classif.rpart", "classif.lda", "classif.svm")
  lrns = lapply(base, makeLearner)
  lrns = lapply(lrns, setPredictType, "prob")
  m = makeStackedLearner(base.learners = lrns,
    predict.type = "prob", method = "hill.climb")
  tmp = train(m, tsk)
  res = predict(tmp, tsk)

  # Regression
  data(BostonHousing, package = "mlbench")
  tsk = makeRegrTask(data = BostonHousing, target = "medv")
  base = c("regr.rpart", "regr.svm")
  lrns = lapply(base, makeLearner)
  m = makeStackedLearner(base.learners = lrns,
    predict.type = "response", method = "compress")
  tmp = train(m, tsk)
  res = predict(tmp, tsk)



