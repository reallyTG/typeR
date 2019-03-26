context("test ess")

test_that("ess work", {
  
  set.seed(123)
  x <- rnorm(10)
  w <- runif(10)
  expect_equal(ess(1), 1)
  expect_equal(ess(rep(1, 5)), 5)
  expect_equal(ess(c(1, rep(0, 5))), 1)
  expect_equal(ess(w), 1/sum((w / sum(w))^2))
  expect_equal(ess(w, function(y) y^2, x), 3.48069786937944)
  
  expect_error(ess("a"))
  expect_error(ess(-2))
  expect_error(ess(w, function(x) x, 1:2))
  expect_error(ess(w, function(x) c(x, x), x))
})


test_that("running_ess work", {
  
  set.seed(123)
  x <- rnorm(10)
  w <- runif(10)
  expect_equal(running_ess(1), 1)
  expect_equal(running_ess(rep(1, 5)), 1:5)
  expect_equal(running_ess(c(1, rep(0, 5))), rep(1, 6))
  expect_equal(running_ess(w[1:3]), c(1, 1 / sum((w[1:2] / sum(w[1:2]))^2), 
    1/sum((w[1:3] / sum(w[1:3]))^2)))
  expect_equal(running_ess(w[1:2], function(y) y^2, x[1:2]), c(1, 1.25826005988405))
  
  expect_error(running_ess("a"))
  expect_error(running_ess(-2))
  expect_error(running_ess(w, function(x) x, 1:2))
  expect_error(running_ess(w, function(x) c(x, x), x))
})

