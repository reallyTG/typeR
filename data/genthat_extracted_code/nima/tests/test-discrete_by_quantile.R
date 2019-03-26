library(nima)
context("Discretizing vectors by quantile")

test_that("range of discretization matches quantiles for numerics", {
  expect_equal(range(discrete_by_quantile(rnorm(100))), c(1, 4))
})

test_that("discretization fails for non-numeric and non-factor inputs", {
  expect_error(discrete_by_quantile(c("foo", "bar")))
})
