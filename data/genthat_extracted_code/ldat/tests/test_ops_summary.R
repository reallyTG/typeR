
context("Ops Summary")

test_ops <- function(fun, x, ...) {
  result_r <- fun(x, ...)
  result_l <- fun(as_lvec(x), ...)
  expect_that(result_r, equals(result_l))
}

test_that("all works", {
  test_ops(all, c(TRUE, TRUE))
  test_ops(all, c(FALSE, TRUE))
  test_ops(all, c(FALSE, FALSE))
  test_ops(all, c(TRUE, TRUE, NA))
  test_ops(all, c(TRUE, TRUE, NA), na.rm = TRUE)
  test_ops(all, c(FALSE, TRUE, NA), na.rm = TRUE)
  test_ops(all, c(FALSE, FALSE, NA), na.rm = TRUE)
  test_ops(all, logical(0), na.rm=TRUE)
})

test_that("any works", {
  test_ops(any, c(TRUE, TRUE))
  test_ops(any, c(FALSE, TRUE))
  test_ops(any, c(FALSE, FALSE))
  test_ops(any, c(TRUE, TRUE, NA))
  test_ops(any, c(TRUE, TRUE, NA), na.rm = TRUE)
  test_ops(any, c(FALSE, TRUE, NA), na.rm = TRUE)
  test_ops(any, c(FALSE, FALSE, NA), na.rm = TRUE)
  test_ops(any, logical(0), na.rm=TRUE)
})

test_that("prod works", {
  test_ops(prod, c(1, -2, 3, -4))
  test_ops(prod, c(1, -2, 3, -4, NA))
  test_ops(prod, c(1, -2, 3, -4, NA), na.rm = TRUE)
  test_ops(prod, numeric(0))
  test_ops(prod, c(TRUE, FALSE))
})

test_that("sum works", {
  test_ops(sum, c(1, -2, 3, -4))
  test_ops(sum, c(1, -2, 3, -4, NA))
  test_ops(sum, c(1, -2, 3, -4, NA), na.rm = TRUE)
  test_ops(sum, numeric(0))
  test_ops(sum, c(TRUE, FALSE))
})

test_that("max works", {
  test_ops(max, c(1, -2, 3, -4))
  test_ops(max, c(1, -2, 3, -4, NA))
  test_ops(max, c(1, -2, 3, -4, NA), na.rm = TRUE)
  expect_warning(test_ops(max, numeric(0)))
  test_ops(max, c(TRUE, FALSE))
})

test_that("min works", {
  test_ops(min, c(1, -2, 3, -4))
  test_ops(min, c(1, -2, 3, -4, NA))
  test_ops(min, c(1, -2, 3, -4, NA), na.rm = TRUE)
  expect_warning(test_ops(min, numeric(0)))
  test_ops(min, c(TRUE, FALSE))
})

test_that("range works", {
  test_ops(range, c(1, -2, 3, -4))
  test_ops(range, c(1, -2, 3, -4, NA))
  test_ops(range, c(1, -2, 3, -4, NA), na.rm = TRUE)
  expect_warning(test_ops(range, numeric(0)))
  test_ops(range, c(TRUE, FALSE))
})

