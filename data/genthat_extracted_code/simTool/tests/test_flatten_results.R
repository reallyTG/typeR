testthat::context("test_flatten_results.R")

data_and_results <-
  list(
    list(list(data = "1. set", results = list(c(a = 1, b = 2)))),
    list(list(data = "2. set", results = list(c(a = 3, b = 4))))
  )
test_that("Extract if only one result is available", {
  expect_identical(
    flatten_results(data_and_results),
    list(c(a = 1, b = 2), c(a = 3, b = 4))
  )
})

data_and_results <-
  list(
    list(list(data = "1. set", results = list(c(a = 1, b = 2), 10, matrix(1, 2, 2)))),
    list(list(data = "2. set", results = list(c(a = 3, b = 4), 20, matrix(2, 2, 2))))
  )

test_that("Extract if more than one result is available", {
  expect_identical(
    flatten_results(data_and_results),
    list(
      c(a = 1, b = 2), 10, matrix(1, 2, 2),
      c(a = 3, b = 4), 20, matrix(2, 2, 2)
    )
  )
})
