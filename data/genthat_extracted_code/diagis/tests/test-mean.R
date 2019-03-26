context("scalar tests")

test_that("scalar means work", {
  
  set.seed(123)
  x <- rnorm(10)
  w <- runif(10)
  expect_equal(weighted_mean(x, w), weighted.mean(x, w))
  expect_equal(running_weighted_mean(x, w)[1:2], c(x[1], weighted.mean(x[1:2], w[1:2])))
  expect_equal(running_mean(x)[1:2], c(x[1], mean(x[1:2])))
  
  expect_error(weighted_mean(1))
  expect_error(weighted_mean(1, 1:2))
  expect_error(weighted_mean(1, "a"))
  expect_error(weighted_mean("a", 1))

  expect_error(running_mean(1, 1:2))
  expect_error(running_mean(1, "a"))
  expect_error(running_mean("a"))
  
  expect_error(running_weighted_mean(1))
  expect_error(running_weighted_mean(1, 1:2))
  expect_error(running_weighted_mean(1, "a"))
  expect_error(running_weighted_mean("a", 1))
  
})

context("vector tests")

test_that("vector means work", {
  
  set.seed(123)
  x <- matrix(rnorm(10), 5, 2)
  w <- runif(5)
  expect_equal(weighted_mean(x, w)[2], weighted.mean(x[, 2], w))
  expect_equal(running_weighted_mean(x, w)[1:2, 1], c(x[1], weighted.mean(x[1:2, 1], w[1:2])))
  expect_equal(running_mean(x)[1:2, 1], c(x[1, 1], mean(x[1:2, 1])))
  
  a <- matrix(1)
  b <- diag(2)
  expect_error(weighted_mean(a))
  expect_error(weighted_mean(a, 1:2))
  expect_error(weighted_mean(b, "a"))
  expect_error(weighted_mean(matrix("a"), 1))

  expect_warning(running_mean(b, TRUE))
  expect_error(running_mean(a, "a"))
  expect_error(running_mean(matrix("a")))
  
  expect_error(running_weighted_mean(a))
  expect_error(running_weighted_mean(b, 1))
  expect_error(running_weighted_mean(b, "a"))
  expect_error(running_weighted_mean(matrix("a"), 1))
  
})


context("matrix tests")

test_that("matrix means work", {
  
  set.seed(123)
  x <- array(rnorm(40), c(5, 2, 4))
  w <- runif(4)
  expect_equal(weighted_mean(x, w)[2, 2], weighted.mean(x[2, 2, ], w))
  
  expect_warning(weighted_mean(x, w, TRUE))
  expect_error(weighted_mean(x))
  expect_error(weighted_mean(x, 1:2))
  expect_error(weighted_mean(x, "a"))
  expect_error(weighted_mean(array("a", c(1, 1, 1)), 1))
  
})
