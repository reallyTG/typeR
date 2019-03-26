context("type coercion")

test_that("type coercion works", {
  x <- as.logical(rvbern(prob = 0.5))
  expect_s3_class(x, "rv")
})

