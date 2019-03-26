library(lg)
context("Partial correlation")

n <- 10
x <- cbind(rnorm(n), rnorm(n), rnorm(n))
lg_object <- lg_main(x)

grid_bad <- cbind(c(1,2,3), c(1,2,3), c(1,2,3))
grid <- cbind(c(1,2,3), c(1,2,3))

condition <- 0
condition_bad <- c(0,1)

test_that("The function produces the correct errors", {
  expect_error(partial_cor(lg_object))
  expect_error(partial_cor(lg_object, grid = grid_bad, condition = condition))
  expect_error(partial_cor(lg_object, grid = grid_bad, condition = condition_bad))
  expect_error(partial_cor(lg_object, grid = grid, condition = condition_bad))})
