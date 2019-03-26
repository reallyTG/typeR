context("util")

test_that("assertions work", {
  expect_error(assert_scalar(NULL), "must be a scalar")
  expect_error(assert_scalar(numeric(0)), "must be a scalar")
  expect_error(assert_scalar(1:2), "must be a scalar")

  expect_error(assert_scalar_logical(1), "must be logical")
  expect_error(assert_scalar_logical(NA), "must not be NA")
  expect_error(assert_scalar_logical(c(TRUE, TRUE)), "must be a scalar")

  expect_error(assert_function(1.5), "must be a function")
  expect_error(assert_function(list()), "must be a function")

  expect_error(C_assert_size(NULL, "xxx"), "xxx must be a scalar")
  expect_error(C_assert_size(1:2, "xxx"), "xxx must be a scalar")
  expect_error(C_assert_size(pi, "xxx"), "xxx must be an integer")
  expect_error(C_assert_size("x", "xxx"), "xxx must be an integer")
  expect_error(C_assert_size(NA_integer_, "xxx"), "xxx must not be NA")
  expect_error(C_assert_size(NA_real_, "xxx"), "xxx must not be NA")
  expect_error(C_assert_size(-3L, "xxx"), "xxx must be nonnegative")
})

test_that("compiler flags", {
  flags <- include_flags(FALSE)
  cmp <- paste0("-I", system.file("include", package = "ring"))
  expect_equal(flags, cmp)
  expect_equal(capture.output(include_flags()), cmp)
})
