context("log1prel")

test_that("log1prel behaves as it should", {
  ## check simple values

  x <- runif(10, -1, 5)
  log1prel.values <- .log1prel(x)

  r.values <- rep.int(1, length(x))
  flag <- x!=0
  r.values[flag] <- log1p(x[flag]) / x[flag]
  expect_equal(log1prel.values, r.values,
               label="log1prel: value tests")

  ## special values
  expect_equal(.log1prel(c(-1, 0, Inf)), c(Inf, 1, 0),
               label="log1prel: special value tests")

  expect_true(is.nan(.log1prel(0/0)), label="log1prel: NaN handling")
  expect_true(is.nan(.log1prel(-Inf)), label="log1prel: -Inf")

  
  ## check with reference to .exprel

  x <- runif(10, -5, 5)
  y <- runif(length(x), -5, 5)

  xi <- .exprel(x * y) * y

  expect_equal(.log1prel(xi*x)*xi, y, label="log1prel: exprel inversion")

}
)
