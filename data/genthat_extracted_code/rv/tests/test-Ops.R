context("Math Ops")

test_that("Mathematical operations with rv objects works", {
  x <- trunc(rvnorm(1))
  expect_s3_class(x, "rv")
  expect_s3_class(-x, "rv")
})
