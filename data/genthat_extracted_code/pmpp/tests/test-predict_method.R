context("Predict method")

library(dplyr)
library(plm)

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
model_noexp_vars <- pmpp(dep_var = "emp", data = EmplUK)
model_exp_vars <- pmpp(dep_var = "emp", exp_var = "output", data = EmplUK)
my_fframe_h3 <- create_fframe(EmplUK, 1983:1985)
my_fframe_h3_filled <- my_fframe_h3
for (i in 1:nrow(my_fframe_h3_filled)) {
  if (all(is.na(my_fframe_h3_filled[i, 5:7]))) {
    my_fframe_h3_filled[i, 5:7] <- my_fframe_h3_filled[i - 1, 5:7]
  }
}
my_fframe_h1 <- create_fframe(EmplUK, 1983)

test_that("predict method works without exp_vars", {
  prediction <- predict(model_noexp_vars, my_fframe_h3)

  expect_true("data.frame" %in% class(prediction))
  expect_equal(colnames(prediction), c(
    "firm", "year", "emp_TRUE",
    "emp_MODEL", "window"
  ))
  expect_true(is.numeric(prediction$emp_MODEL))
})

test_that("predict method works with exp_vars, with horizon T+1", {
  prediction <- predict(model_exp_vars, my_fframe_h1)

  expect_true("data.frame" %in% class(prediction))
  expect_equal(colnames(prediction), c(
    "firm", "year", "emp_TRUE",
    "emp_MODEL", "window"
  ))
  expect_true(is.numeric(prediction$emp_MODEL))
})

test_that("predict method works with exp_vars, with horizon > T+1", {
  prediction <- predict(model_exp_vars, my_fframe_h3_filled)

  expect_true("data.frame" %in% class(prediction))
  expect_equal(colnames(prediction), c(
    "firm", "year", "emp_TRUE",
    "emp_MODEL", "window"
  ))
  expect_true(is.numeric(prediction$emp_MODEL))
})
