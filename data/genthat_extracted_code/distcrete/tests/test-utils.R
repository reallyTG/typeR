context("utils")

test_that("assert_in_range", {
  expect_null(assert_in_range(0.5, 0, 1))
  expect_error(assert_in_range(1.1, 0, 1),
               "must be in range")
  expect_null(assert_in_range(1, 0, 1),
               "must be in range")
})

test_that("assert scalar", {
  expect_error(assert_scalar(NULL), "must be a scalar")
  expect_error(assert_scalar(1:2), "must be a scalar")
})

test_that("assert_numeric", {
  expect_error(assert_numeric(NULL), "must be numeric")
  expect_error(assert_numeric("a"), "must be numeric")
  expect_error(assert_numeric(TRUE), "must be numeric")

  expect_null(assert_numeric(1L))
  expect_null(assert_numeric(NA_real_))
})

test_that("assert_nonmissing", {
  expect_error(assert_nonmissing(NA, "must not be NA"))
  expect_error(assert_nonmissing(c(1, NA), "must not be NA"))
})

test_that("assert_function", {
  expect_error(assert_function(NULL, "must be a function"))
  expect_null(assert_function(sin))
  expect_null(assert_function(assert_function))
})
