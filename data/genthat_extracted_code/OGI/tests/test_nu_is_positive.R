context("if nu is positive")

test_that("check if nu is positivr", {
  X = matrix(c(1,2,4,3,5,6), 3, 2)

  expect_error(ogi(X, nu=c(0,1)), "nu is not positive.")
  expect_error(ogi(X, nu=c(1,1)), NA)

})
