context("test-assertions")

test_that("is_single_numeric works", {
  expect_true(is_single_numeric(23))
  expect_true(is_single_numeric(182L))
  expect_true(is_single_numeric(pi))

  expect_false(is_single_numeric("a"))
  expect_false(is_single_numeric(NA))
  expect_false(is_single_numeric(NaN))
  expect_false(is_single_numeric(NULL))
  expect_false(is_single_numeric(c(1,2)))
  expect_false(is_single_numeric(1:10))
  expect_false(is_single_numeric(~ help_me + im_trapped + in_a_unit_test))
  expect_false(is_single_numeric(function(x) "call 911 now"))
})

test_that("is_bounded works", {
  expect_true(is_bounded(1))
  expect_true(is_bounded(pi))
  expect_true(is_bounded(1:10))
  expect_false(is_bounded(Inf))
  expect_false(is_bounded(-Inf))
  expect_false(is_bounded(c(NA, 1, 2)))

  expect_true(is_bounded(-Inf, lower_closed = TRUE))
  expect_true(is_bounded(Inf, upper_closed = TRUE))
  expect_false(is_bounded(Inf, lower_closed = TRUE))
  expect_false(is_bounded(-Inf, upper_closed = TRUE))
  expect_false(is_bounded("Inf", lower_closed = TRUE))
  expect_false(is_bounded("-Inf", upper_closed = TRUE))

  expect_true(is_bounded(100, lower_closed = TRUE, lower_bound = 100))
  expect_false(is_bounded(100, lower_closed = FALSE, lower_bound = 100))
  expect_true(is_bounded(100, upper_closed = TRUE, upper_bound = 100))
  expect_false(is_bounded(100, upper_closed = FALSE, upper_bound = 100))
  expect_true(is_bounded(100, upper_closed = TRUE, upper_bound = 100, lower_closed = TRUE, lower_bound = 100))
  expect_false(is_bounded(100, upper_closed = FALSE, upper_bound = 100, lower_closed = FALSE, lower_bound = 100))
})

test_that("has_names works", {
  expect_true(list(a = 1, b = 2) %has_names% "a")
  expect_true(list(a = 1, b = 2) %has_names% c("a", "b"))
  expect_false(list(a = 1, b = 2) %has_names% "c")

  expect_true(c(a = 1, b = 2) %has_names% "a")
  expect_true(c(a = 1, b = 2) %has_names% c("a", "b"))
  expect_false(c(a = 1, b = 2) %has_names% "c")
})

test_that("all_in works", {
  expect_true(c(1, 2, 3) %all_in% -1:4)
  expect_true(1:3 %all_in% c(-60, 10, 1, -5, 2, -9, 3))
  expect_true("a" %all_in% letters)

  expect_false(c(1, 2, 3) %all_in% 3:10)
  expect_false(1:60 %all_in% c(-60, 10, 1, -5, 2, -9, 3))
  expect_false("a" %all_in% LETTERS)
})
