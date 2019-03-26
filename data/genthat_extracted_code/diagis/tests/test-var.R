context("scalar tests")

test_that("scalar vars work", {
  
  set.seed(123)
  x <- rnorm(10)
  w <- runif(10)
  expect_equal(weighted_var(rep(1, 10), w), 0)
  expect_equal(weighted_var(x, rep(1, 10), method = "unbiased"), var(x))
  w2 <- w / sum(w)
  expect_equal(weighted_var(x, w, method = "unbiased"), (sum(w2 * x^2) - sum(w2 * x)^2) / (1 - sum(w2^2)))
  expect_equal(weighted_var(x, w, method = "moment"), sum(w2 * x^2) - sum(w2 * x)^2)
  w2 <- w[1:2] / sum(w[1:2])
  x2 <- x[1:2]
  expect_equal(running_weighted_var(x, w, "unbiased")[2], (sum(w2 * x2^2) - sum(w2 * x2)^2) / (1 - sum(w2^2)))
  expect_equal(running_var(x, "unbiased")[1:2], c(0, var(x[1:2])))
  
  expect_error(weighted_var(1))
  expect_error(weighted_var(1, 1:2))
  expect_error(weighted_var(1, "a"))
  expect_error(weighted_var("a", 1))
  
  expect_error(running_var(1, 1:2))
  
  expect_error(running_weighted_var(1))
  expect_error(running_weighted_var(1, 1:2))
  expect_error(running_weighted_var(1, "a"))
  expect_error(running_weighted_var("a", 1))
  
})

context("vector tests")

test_that("vector vars work", {
  
  set.seed(123)
  x <- matrix(rnorm(6), 3, 2)
  w <- runif(3)
  expect_equal(weighted_var(matrix(1, 3, 2), w), matrix(0, 2, 2))
  expect_equal(weighted_var(x, rep(1, 3), "unbiased"), var(x))
  w2 <- w / sum(w)
  expect_equal(weighted_var(x, w, "unbiased")[1, 1], (sum(w2 * x[, 1]^2) - sum(w2 * x[, 1])^2) / (1 - sum(w2^2)))
  expect_equal(weighted_var(x, w, method = "moment")[1, 1], (sum(w2 * x[, 1]^2) - sum(w2 * x[, 1])^2))

  expect_error(weighted_var(x))
  expect_error(weighted_var(x, 1:2))
  expect_error(weighted_var(x, "a"))
  expect_error(weighted_var(matrix("a"), 1))
  
})


context("matrix tests")

test_that("matrix vars work", {
  
  set.seed(123)
  x <- array(rnorm(40), c(5, 2, 4))
  w <- runif(4)
  expect_equal(weighted_var(x, w)[2, 2, 3], weighted_var(x[3, 2, ], w))
  w2 <- w / sum(w)
  expect_equal(weighted_var(x, w, method = "moment")[2, 2, 3], (sum(w2 * x[3, 2, ]^2) - sum(w2 * x[3, 2, ])^2))

  expect_error(weighted_var(x))
  expect_error(weighted_var(x, 1:2))
  expect_error(weighted_var(x, "a"))
  expect_error(weighted_var(array("a", c(1, 1, 1)), 1))

  expect_error(weighted_var(x))
  expect_error(weighted_var(x, 1:2))
  expect_error(weighted_var(x, "a"))
  expect_error(weighted_var(matrix("a"), 1))  
})
