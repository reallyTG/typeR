library(mlr)
library(ranger)
library(randomForest)

context("Output check")

test_that("classification ranger", {
  num.trees = 200
  data = getTaskData(sonar.task)
  mod = ranger::ranger(Class ~., data = data, num.trees = num.trees, keep.inbag = TRUE)
  measures = list(mmce, auc, brier)
  results = OOBCurve(mod, measures = measures, task = sonar.task, data = data)
  
  expect_true(is.data.frame(results))
  expect_equal(dim(results), c(num.trees, length(measures)))
  expect_false(any(is.na(results[, 1:2])))
  expect_true(any(is.na(results[, 3])))
})

test_that("regression ranger", {
  num.trees = 200
  data = mlr::getTaskData(bh.task)
  mod = ranger::ranger(medv ~., data = data, num.trees = num.trees, keep.inbag = TRUE)
  measures = list(mse, mae)
  results = OOBCurve(mod, measures = measures, task = bh.task, data = data)

  expect_true(is.data.frame(results))
  expect_equal(dim(results), c(num.trees, length(measures)))
  expect_true(any(is.na(results[, 1])))
  expect_true(any(is.na(results[, 2])))
})

test_that("classification randomForest", {
  ntree = 200
  # Classification
  data = mlr::getTaskData(sonar.task)
  mod = randomForest::randomForest(Class ~., data = data, ntree = ntree, keep.inbag = TRUE)
  # Application of the main function
  measures = list(mmce, auc, brier)
  results = OOBCurve(mod, measures = measures, task = sonar.task, data = data)
  
  expect_true(is.data.frame(results))
  expect_equal(dim(results), c(ntree, length(measures)))
  expect_false(any(is.na(results[, 1:2])))
  expect_true(any(is.na(results[, 3])))
})

test_that("regression randomForest", {
  ntree = 200
  data = mlr::getTaskData(bh.task)
  mod = randomForest::randomForest(medv ~., data = data, ntree = ntree, keep.inbag = TRUE)
  measures = list(mse, mae)
  results = OOBCurve(mod, measures = measures, task = bh.task, data = data)
  
  expect_true(is.data.frame(results))
  expect_equal(dim(results), c(ntree, length(measures)))
  expect_true(any(is.na(results[, 1])))
  expect_true(any(is.na(results[, 2])))
})

test_that("trained model with mlr", {
  num.trees = 200
  data = mlr::getTaskData(sonar.task)
  mod = mlr::train(makeLearner("classif.ranger", keep.inbag = TRUE, num.trees = num.trees), sonar.task)
  measures = list(mmce, auc, brier)
  results = OOBCurve(mod, measures = measures, task = sonar.task, data = data)
  
  expect_true(is.data.frame(results))
  expect_equal(dim(results), c(num.trees, length(measures)))
  expect_false(any(is.na(results[, 1:2])))
  expect_true(any(is.na(results[, 3])))
})

test_that("OOBCurvePars", {
  num.trees = 200
  data = mlr::getTaskData(sonar.task)
  mod = mlr::makeLearner("classif.ranger", num.trees = num.trees, predict.type = "prob")
  measures = list(mmce, auc, brier)
  nr.grid = 11
  results = OOBCurvePars(mod, task = sonar.task, pars = "min.node.size", nr.grid = nr.grid, measures = measures)
  
  expect_true(is.numeric(results$par.vals))
  expect_true(is.data.frame(results$performances))
  expect_equal(dim(results$performances), c(nr.grid, length(measures)))
  expect_false(any(is.na(results$performances)))
})
