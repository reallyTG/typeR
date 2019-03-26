context("positive definite")

test_that("check if S is positive semidefinite", {
  X = matrix(1:6, 3, 2)

  expect_error(ogi(X), "S is not positive definite.")
  expect_error(ogi(X, force=TRUE), NA)

  S = matrix(c(-1,0,0,-1), 2, 2)

  expect_error(cov2weight(S), "S is not positive definite.")
  expect_error(cov2weight(S, force=TRUE), "S is not positive semi-definite.")

  expect_error(cov2biu(S), "S is not positive definite.")

})
