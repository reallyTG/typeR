context("sobol_matrices")

test_that("multiplication works", {
  n <- 100
  k <- 3
  expect_is(sobol_matrices(n = 100, k = 3), "matrix")
})
