library(optim.functions)
context("vectorization of functions")

vect = c(1,2,3,4,5,6)
mtx = array(c(1,2,3,4,5,6), dim=c(2,3))

test_that("the general vectorization function works", {
  mysum = function(x) sum(x)
  expect_equal(length(opt.vect(mysum)(mtx)), 2) # nrow(mtx)
  expect_equal(length(opt.vect(mysum)(vect)), 1)
})

test_that("the ackley function is properly vectorized", {
  expect_equal(length(ackley(mtx)), 2)
  expect_equal(length(ackley(vect)), 1)
})

test_that("the rosenbrock function is properly vectorized", {
  expect_equal(length(rosenbrock(mtx)), 2)
  expect_equal(length(rosenbrock(vect)), 1)
})

test_that("the spherical function is properly vectorized", {
  expect_equal(length(spherical(mtx)), 2)
  expect_equal(length(spherical(vect)), 1)
})

test_that("the schwefel function is properly vectorized", {
  expect_equal(length(schwefel(mtx)), 2)
  expect_equal(length(schwefel(vect)), 1)
})

test_that("the zakharov function is properly vectorized", {
  expect_equal(length(zakharov(mtx)), 2)
  expect_equal(length(zakharov(vect)), 1)
})

