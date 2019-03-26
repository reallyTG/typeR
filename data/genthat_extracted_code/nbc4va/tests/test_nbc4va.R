# Richard Wen (rwenite@gmail.com)
# Tests for the external functions in the nbc4va package.


# (Data) Generate some data used for test ----

library(testthat)
library(nbc4va)
set.seed(1)

# (Data) Create some random verbal autopsy data
va <- data.frame(id=c(".", "a2", "a3", "a4", "$5", "-5", "d1", "", "a.5", "(a2)", "1_a"))
va$causes <- c("HIV", "Stroke", "Cancer", "HIV", "Cancer", "Stroke", "Neoplasms", "CVD", "Maternal", "CVD", "NeOplams")
vaRaw <- va
va$sym1 <- sample (0:1, 11, replace=TRUE)
va$sym2 <- sample (0:1, 11, replace=TRUE)
va$sym3 <- sample (0:1, 11, replace=TRUE)
vaRaw$sym1 <- sample (c(0, 1, 99, "5", "", "*"), 11, replace=TRUE)
vaRaw$sym2 <- sample (c(0, 1, 99, "5", "", "#"), 11, replace=TRUE)
vaRaw$sym3 <- sample (c(0, 1, 99, "5", "", "$"), 11, replace=TRUE)

# (Data_Split) Split into train and test sets
train <- va[1:5, ]
test <- va[6:11, ]
trainRaw <- vaRaw[1:5, ]
testRaw <- vaRaw[6:11, ]

# (Results) Different example results
expect_warning(results <- nbc(train, test))
expect_warning(resultsRaw <- nbc(trainRaw, testRaw))
noCauses <- test[, -2]
expect_warning(resultsNoCauses <- nbc(train, noCauses, known=FALSE))

# (nbc) Tests for the nbc() function ----

test_that("nbc() creates an object of class \"nbc\"", {
  expect_is(results, "nbc")
})

test_that("nbc() can handle unknown symptoms", {
  expect_is(resultsRaw, "nbc")
})

test_that("nbc() sets the out$test.known to correctly indicate whether or not the test causes are known", {
  expect_equal(resultsNoCauses$test.known, FALSE)
  expect_warning(expect_equal(length(unique(nbc4va:::internalCheckNBC(train, noCauses, known=FALSE)$test[, 2])), 1))
  expect_equal(results$test.known, TRUE)
})

test_that("nbc() can handle incorrect column data types in the correct positions", {

  # (train_Incorrect) Data with incorrect column data types in train
  trainTypes <- train
  trainTypes$sym1 <- as.character(train$sym1)
  trainTypes$causes <- as.factor(train$causes)
  trainTypes$id <- as.numeric(train$id)
  trainTypes$sym3 <- as.factor(train$sym3)

  # (test_Incorrect) Data with incorrect column data types in test
  testTypes <- test
  testTypes$sym1 <- as.character(test$sym1)
  testTypes$causes <- as.factor(test$causes)
  testTypes$id <- as.numeric(test$id)
  testTypes$sym3 <- as.factor(test$sym3)

  # (Check_Types) If correct, warnings should display
  expect_warning(nbc4va:::internalCheckNBC(trainTypes, testTypes))
  expect_warning(nbc4va:::internalCheckNBC(train, testTypes))

  # (Check_Type_Results) If correct, data types should be correctly convertted
  expect_warning(resultsTypes <- nbc4va:::internalCheckNBC(trainTypes, testTypes))
  syms <- 3:ncol(resultsTypes$train)
  expect_equal(is.character(resultsTypes$train[, 1]), TRUE)
  expect_equal(is.character(resultsTypes$train[, 2]), TRUE)
  expect_equal(is.character(resultsTypes$test[, 1]), TRUE)
  expect_equal(is.character(resultsTypes$test[, 2]), TRUE)
  expect_equal(all(sapply(resultsTypes$train[syms], is.numeric)), TRUE)
  expect_equal(all(sapply(resultsTypes$test[syms], is.numeric)), TRUE)
})

test_that("nbc() creates the correct outputs",{
  out <- c("prob.causes",
           "pred.causes",
           "train",
           "train.ids",
           "train.causes",
           "train.samples",
           "test",
           "test.ids",
           "test.causes",
           "test.samples",
           "test.known",
           "symptoms",
           "causes",
           "causes.train",
           "causes.test",
           "causes.pred",
           "causes.obs",
           "pred",
           "obs",
           "obs.causes",
           "prob")
  expect_equal(all(out %in% names(results)), TRUE)
  outNoCauses <- c("test.causes", "causes.test", "causes.obs", "obs.causes")
  expect_equal(!all(outNoCauses %in% names(resultsNoCauses)), TRUE)

  # (Check_DataTypes) If correct, data types of items in nbc object should be consistent
  expect_equal(is.numeric(results$prob.causes), TRUE)
  expect_equal(is.character(results$pred.causes), TRUE)
  expect_equal(is.data.frame(results$train), TRUE)
  expect_equal(is.character(results$train.ids), TRUE)
  expect_equal(is.character(results$train.causes), TRUE)
  expect_equal(is.numeric(results$train.samples), TRUE)
  expect_equal(is.data.frame(results$test), TRUE)
  expect_equal(is.character(results$test.ids), TRUE)
  expect_equal(is.character(results$test.causes), TRUE)
  expect_equal(is.numeric(results$test.samples), TRUE)
  expect_equal(is.logical(results$test.known), TRUE)
  expect_equal(is.character(results$symptoms), TRUE)
  expect_equal(is.character(results$causes), TRUE)
  expect_equal(is.character(results$causes.train), TRUE)
  expect_equal(is.character(results$causes.test), TRUE)
  expect_equal(is.character(results$causes.pred), TRUE)
  expect_equal(is.character(results$causes.obs), TRUE)
  expect_equal(is.data.frame(results$pred), TRUE)
  expect_equal(is.character(results$obs.causes), TRUE)
  expect_equal(is.data.frame(results$prob), TRUE)
})

# (summary.nbc) Tests for the summary.nbc() function ----

test_that("summary.nbc() creates an object of class \"nbc_summary\"", {
  expect_warning(expect_is(summary(results), "nbc_summary"))
})

test_that("summary.nbc() can handle incorrect input data types", {
  expect_warning(nbc4va:::internalCheckNBCSummary(results, top="5"))
  expect_error(expect_warning(nbc4va:::internalCheckNBCSummary(results, id=5)))
  expect_warning(nbc4va:::internalCheckNBCSummary(results, csmfa.obs=c(9, 10, 5)))
  expect_error(expect_warning(nbc4va:::internalCheckNBCSummary(results, top="ab")))
  expect_error(expect_warning(nbc4va:::internalCheckNBCSummary(results, id=NA)))
})

test_that("summary.nbc() modifies nbc object correctly if an existing id is given", {
  expect_warning(briefWithID <- summary(results, id="d1"))
  modded <- c("test", "test.ids", "test.causes", "obs", "obs.causes", "prob", "prob.causes", "pred", "pred.causes")
  added <- c("id", "top", "top.prob")
  expect_equal(all(added %in% names(briefWithID)), TRUE)

  # (Check_ID_Outputs) If correct, all [modded] should have rows or lengths of 1
  for (x in modded) {
    out <- briefWithID[[x]]
    if (is.data.frame(out) || is.matrix(out)) {
      expect_equal(nrow(out), 1)
    } else {
      expect_equal(length(out), 1)
    }
  }

  # (Check_ID_Added) If correct, data types should be consistent
  expect_equal(is.character(briefWithID$id), TRUE)
  expect_equal(is.numeric(briefWithID$top), TRUE)
  expect_equal(is.numeric(briefWithID$top.prob), TRUE)
})

test_that("summary.nbc() adds to nbc object correctly if no id is given", {
  expect_warning(briefNoID <- summary(results))
  expect_warning(briefNoIDNoCauses <- summary(resultsNoCauses))
  added <- c("metrics.causes", "metrics.all", "top.csmf.pred", "top.csmf.obs")
  notadded <- c("metrics", "top.csmf.obs")
  expect_equal(all(added %in% names(briefNoID)), TRUE)
  expect_equal(all(!notadded %in% names(briefNoIDNoCauses)), TRUE)

  # (Check_Summary_Object) If correct, values should be consistent to known test causes
  expect_equal(is.data.frame(briefNoIDNoCauses$metrics.causes), TRUE)
  expect_equal(is.null(briefNoIDNoCauses$metrics.all), TRUE)
  expect_equal(is.null(briefNoIDNoCauses$top.csmf.obs), TRUE)
  expect_equal(is.null(briefNoID$id), TRUE)
  expect_equal(is.data.frame(briefNoID$metrics.causes), TRUE)
  expect_equal(is.numeric(briefNoID$metrics.all), TRUE)

  # (Check_Metrics) If correct, metrics should have consistent columns to known test causes
  expect_equal(ncol(briefNoID$metrics.causes) > 2, TRUE)
  metrics <- c("Cause", "TruePositives", "TrueNegatives", "FalsePositives", "FalseNegatives", "Sensitivity", "CSMFpredicted", "CSMFobserved")
  expect_equal(all(metrics %in% names(briefNoID$metrics.causes)), TRUE)
  nometrics <- c("TruePositives", "TrueNegatives", "FalsePositives", "FalseNegatives", "Sensitivity", "PCCC", "CSMFobserved")
  expect_equal(all(!nometrics %in% names(briefNoIDNoCauses$metrics.causes)), TRUE)
})

test_that("summary.nbc() generates the correct top causes if no id is given", {
  expect_warning(briefNoID <- summary(results, top=3))

  # (Check_Top_NoID) If correct, the top causes items should be consistent with the nbc object
  expect_equal(length(briefNoID$top.csmf.pred) == briefNoID$top, TRUE)
  expect_equal(length(briefNoID$top.csmf.obs) == briefNoID$top, TRUE)
})

test_that("summary.nbc() generates the correct top causes if an id is given", {
  expect_warning(briefWithID <- summary(results, top=10, id="d1"))
  expect_equal(length(briefWithID$top.prob) == briefWithID$top, TRUE)
})

test_that("summary.nbc() throws an error if the id is not found", {
  expect_error(summary(results, top=10, id="c1"))
})
