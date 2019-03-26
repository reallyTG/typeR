library(scdensity)
context("Sharpening by greedy algorithm")

test_that("isUnimodal works correctly", {
  x1 <- seq(-4, 4, length.out=250)
  x2 <- seq(0, 10, length.out=250)
  f1 <- dnorm(x1)                      #-unimodal
  f2 <- dexp(x2)                       #-unimodal, monotone
  f3 <- f1 + f2                        #-bimodal
  expect_true(isUnimodal(f1))
  expect_true(isUnimodal(f2))
  expect_false(isUnimodal(f3))
})

test_that("improve works the same whether or not x is sorted", {
  n <- 50
  x1 <- rnorm(n)
  x2 <- sort(x1)
  y0 <- rep(0,n)
  confun <- function(y) sqrt(sum(y^2)) < 6
  y1 <- improve(y0,x1,confun)
  y2 <- improve(y0,x2,confun)
  expect_equal(sum(abs(y1-x1)), sum(abs(y2-x2)))
  expect_equal(y1[order(x1)], y2)
})

test_that("If x satisfies the constraint, improve moves all points to home.", {
  n <- 50
  tol <- 1e-6
  x <- rnorm(n)
  y0 <- rep(0,n)
  confun <- function(y) TRUE
  y <- improve(y0,x,confun,tol=tol)
  expect_true(all(abs(y-x)<tol))
})

test_that("improve returns a warning if maxpasses is too small.", {
  n <- 150
  tol <- 1e-6
  x <- rnorm(n)
  y0 <- rep(0,n)
  confun <- function(y) sqrt(sum(y^2)) < 10
  expect_warning(improve(y0,x,confun,tol=tol,maxpasses=3))
})

test_that("improve is unaffected by duplicate observations in x.", {
  n <- 50
  x <- rnorm(n)
  x <- sort(c(x, x))
  y0 <- rep(0,2*n)
  confun <- function(y) TRUE
  tol <- 1e-4
  y <- improve(y0,x,confun,tol=tol)
  expect_true(all(abs(y-x)<=tol))
  expect_true(all(diff(y)>=0))
})

test_that("Feeding an incompatible constraint to the greedy method produces an error.", {
  n <- 30
  x <- rlnorm(n)
  badConstraints = c("twoInflections", "twoInflections+", "symmetric", "bimodal")
  for (i in 1:length(badConstraints)) {
    expect_error(scdensity(x, constraint=badConstraints[i], method="greedy"),
                 regexp="not compatible")
  }
})
























