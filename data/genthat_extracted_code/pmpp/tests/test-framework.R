context("Entire framework and output format")

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))

test_that("the entire framework works with QMLEpar", {
  model <- pmpp(dep_var = "emp", data = EmplUK)

  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with QMLEker", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "kernel", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with ABondpar", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "gaussian", common_par_method = "GMM_ABond", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with ABondker", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "kernel", common_par_method = "GMM_ABond", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with BBondpar", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "gaussian", common_par_method = "GMM_BBond", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with BBondker", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "kernel", common_par_method = "GMM_BBond", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with ABoverpar", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "gaussian", common_par_method = "GMM_ABover", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with ABoverker", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "kernel", common_par_method = "GMM_ABover", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with SSYSpar", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "gaussian", common_par_method = "GMM_SSYS", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})

test_that("the entire framework works with SSYSker", {
  model <- pmpp(
    dep_var = "emp",
    post_mean_method = "kernel", common_par_method = "GMM_SSYS", data = EmplUK
  )
  expect_true("pmpp" %in% class(model))
  expect_equal(length(model), 11)
  expect_equal(length(model$intercept), 140)
})
