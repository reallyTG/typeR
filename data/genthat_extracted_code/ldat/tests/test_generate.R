
context("generate")

options(chunk_size = 1E3)

test_that("generate works", {
  set.seed(1)
  x <- generate(2E4, rnorm)
  set.seed(1)
  y <- rnorm(2E4)
  expect_that(as_rvec(x), equals(y))

  set.seed(1)
  x <- generate(2E4, function(n) sample(6, n, replace = TRUE))
  set.seed(1)
  y <- sample(6, 2E4, replace = TRUE)
  expect_that(as_rvec(x), equals(y))
})
