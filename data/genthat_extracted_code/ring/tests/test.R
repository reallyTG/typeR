context("testing")

test_that("basics", {
  set.seed(1)
  n <- 5L
  p <- 0.1
  x <- .Call("test", n, p, PACKAGE = "testing")
  expect_lte(length(x), n)
  expect_true(all(x[-length(x)] > p))
  expect_false(all(x[[length(x)]] > p))

  xx <- replicate(100, .Call("test", n, p), FALSE)
  expect_true(all(lengths(xx) <= n))
  expect_true(any(lengths(xx) < n))
  expect_true(all(vapply(xx, function(x) all(x[-length(x)] > p), logical(1))))
  expect_false(any(vapply(xx, function(x) x[[length(x)]] > p, logical(1))))
})
