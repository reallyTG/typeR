context("Sobol Sequence: test Sobol Sequence")
library(SobolSequence)

test_that("test sobolSequence dimMinMax", {
  rs <- sobolSequence.dimMinMax()
  expect_true(rs[1] <= 2)
  expect_true(rs[2] >= 21201)
})

test_that("test sobolSequence dimF2MinMax", {
  rs <- sobolSequence.dimF2MinMax(10)
  expect_true(rs[1] <= 10)
  expect_true(rs[2] >= 18)
})

test_that("test sobolSequence points", {
  s <- 4
  m <- 10
  n <- 2^m
  matrix <- sobolSequence.points(dimR=s, dimF2=m, count=n)
  expect_equal(nrow(matrix), n)
  expect_equal(ncol(matrix), s)
  expect_true(all(matrix < 1))
  expect_true(all(matrix > 0))
})

test_that("test sobolSequence points digitalShift", {
  s <- 4
  m <- 11
  n <- 2^m
  matrix <- sobolSequence.points(dimR=s, dimF2=m, count=n, digitalShift=TRUE)
  expect_equal(nrow(matrix), n)
  expect_equal(ncol(matrix), s)
  expect_true(all(matrix < 1))
  expect_true(all(matrix > 0))
})
