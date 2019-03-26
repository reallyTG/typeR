context("list functions")

test_that("merge lists of vectors", {
  x <- list(a = 1, b = 10)
  y <- list(b = 20, c = 100)

  expect_equal(mergeLists(x, x), list(a = c(1, 1), b = c(10, 10)))
  expect_equal(mergeLists(x, y), list(a = 1, b = c(10, 20), c = 100))

  expect_equal(mergeLists(x, c(x, 1)), list(a = c(1, 1), b = c(10, 10)))
  expect_equal(mergeLists(c(x, 5), y), list(a = 1, b = c(10, 20), c = 100))
})

test_that("trim a list", {
  expect_error(listTrim(random_test_integers()))

  cl <- as.list(cars)
  expect_identical(listTrim(cl), cl)
  expect_identical(listTrim(c(cl, NA)), cl)
  expect_identical(listTrim(c(NA, cl)), cl)
  expect_identical(listTrim(c(NA, cl, NA)), cl)
  expect_identical(listTrim(c(list(NULL), NA, cl)), cl)


})

test_that("is a list flat", {
  expect_true(isFlat(list(1)))
  expect_true(isFlat(list(1, 2, 3)))
  expect_that(length(isFlat(bad_input)), testthat::equals(1))
})
