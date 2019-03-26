context("exprel")

test_that("exprel behaves as it should", {
  ## first check some simple values
  values <- c(-Inf, NA, seq(-5, 5, length.out=10))
  r.values <- expm1(values) / values
  exprel.values <- .exprel(values)
  expect_equal(exprel.values, r.values,
               label="exprel: value tests")


  ## the naive R code doesn't compute these right so force the
  ## computation.
  values <- c(Inf, 0)
  exprel.values <- .exprel(values)
  desired.values <- c(Inf, 1)
  expect_equal(exprel.values, desired.values,
               label="exprel: special value tests")


  ## and here's a different special case
  expect_true(is.nan(.exprel(0/0)),
              label="exprel: NaN handling")

}
)
