context("LowWAFOMNX: test Low WAFOM Niederreiter-Xing")
library(LowWAFOMNX)

test_that("test lowWAFOMNX dimMinMax", {
  rs <- lowWAFOMNX.dimMinMax()
  expect_true(rs[1] <= 4)
  expect_true(rs[2] >= 32)
})

test_that("test lowWAFOMNX dimF2MinMax", {
  rs <- lowWAFOMNX.dimF2MinMax(10)
  expect_true(rs[1] <= 10)
  expect_true(rs[2] >= 18)
})

test_that("test lowWAFOMNX points", {
  s <- 4
  m <- 10
  n <- 2^m
  matrix <- lowWAFOMNX.points(dimR=s, dimF2=m)
  expect_equal(nrow(matrix), n)
  expect_equal(ncol(matrix), s)
  expect_true(all(matrix < 1))
  expect_true(all(matrix > 0))
  r2 <- c(0.878349, 0.663337, 0.750795, 0.434933)
  expect_equal(matrix[2,], r2, tolerance=0.000001)
})

test_that("test lowWAFOMNX points digitalShift", {
  s <- 4
  m <- 11
  n <- 2^m
  matrix <- lowWAFOMNX.points(dimR=s, dimF2=m, digitalShift=TRUE)
  expect_equal(nrow(matrix), n)
  expect_equal(ncol(matrix), s)
  expect_true(all(matrix < 1))
  expect_true(all(matrix > 0))
})
