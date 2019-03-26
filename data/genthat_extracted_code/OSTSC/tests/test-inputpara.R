context("input other parameters")

test_that("input parameters class, rario, per, r, k, m are numetic values", {
  # create sample and label data
  data("Dataset_Synthetic_Control")
  train.label <- Dataset_Synthetic_Control$train.y
  train.sample <- Dataset_Synthetic_Control$train.x
  # oversampling
  expect_error( OSTSC(train.sample, train.label, class = "1"), "The parameter class is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, ratio = "1"), "The parameter ratio is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, per = "1"), "The parameter per is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, r = "1"), "The parameter r is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, k = "1"), "The parameter k is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, m = "1"), "The parameter m is not in correct format" )
})

test_that("input parameters rario, per, r, k, m locate in correct range", {
  # create sample and label data
  data("Dataset_Synthetic_Control")
  train.label <- Dataset_Synthetic_Control$train.y
  train.sample <- Dataset_Synthetic_Control$train.x
  # oversampling
  expect_error( OSTSC(train.sample, train.label, ratio = 0), "The parameter ratio is not in correct range" )
  expect_error( OSTSC(train.sample, train.label, per = 2), "The parameter per is not in correct range" )
  expect_error( OSTSC(train.sample, train.label, r = 0), "The parameter r is not in correct range" )
  expect_error( OSTSC(train.sample, train.label, k = 0), "The parameter k is not in correct range" )
  expect_error( OSTSC(train.sample, train.label, k = 0.6), "The parameter k is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, m = 0), "The parameter m is not in correct range" )
  expect_error( OSTSC(train.sample, train.label, m = 1.6), "The parameter m is not in correct format" )
})

test_that("input parameters class, rario, per, r, k, m is a single value", {
  # create sample and label data
  data("Dataset_Synthetic_Control")
  train.label <- Dataset_Synthetic_Control$train.y
  train.sample <- Dataset_Synthetic_Control$train.x
  # oversampling
  expect_error( OSTSC(train.sample, train.label, class = c(1, 1)), "The parameter class is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, ratio = c(1, 1)), "The parameter ratio is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, per = c(1, 1)), "The parameter per is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, r = c(1, 1)), "The parameter r is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, k = c(1, 1)), "The parameter k is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, m = c(1, 1)), "The parameter m is not in correct format" )
})

test_that("input parameters parallel, progBar is boolean value", {
  # create sample and label data
  data("Dataset_Synthetic_Control")
  train.label <- Dataset_Synthetic_Control$train.y
  train.sample <- Dataset_Synthetic_Control$train.x
  # oversampling
  expect_error( OSTSC(train.sample, train.label, parallel = 1), "The parameter parallel is not in correct format" )
  expect_error( OSTSC(train.sample, train.label, progBar = 1), "The parameter progBar is not in correct format" )
})