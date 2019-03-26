context("Matrix multiplication")

test_that("X.t(X)",{

  X <-matrix(runif(100), ncol=20)
  R1  <- xxt(X)
  R2 <- X %*% t(X)

  expect_equal(R1,R2)

})
