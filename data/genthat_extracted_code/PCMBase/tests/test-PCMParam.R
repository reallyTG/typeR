library(testthat)
context("PCMParam")

library(PCMBase)

if(PCMBaseIsADevRelease()) {

  list2env(PCMBaseTestObjects, globalenv())

  set.seed(1, kind = "Mersenne-Twister", normal.kind = "Inversion")

  k <- PCMNumTraits(model.ab.123)
  R <- PCMNumRegimes(model.ab.123)
  randVecs1 <- PCMParamRandomVecParams(o = model.ab.123, k = k, R = R, n = 10)

  test_that("randVecs1 is 10-row matrix",
            expect_true(is.matrix(randVecs1) && nrow(randVecs1) == 10L))

  randVecs2 <- PCMParamRandomVecParams(
    o = model.ab.123, k = k, R = R, n = 10)

  test_that("randVecs2 is 10-row matrix",
            expect_true(is.matrix(randVecs2) && nrow(randVecs2) == 10L))

  randVecs3 <- PCMParamRandomVecParams(
    o = model.ab.123, k = k, R = R, n = 10)

  test_that("randVecs3 is 10-row matrix",
            expect_true(is.matrix(randVecs3) && nrow(randVecs3) == 10L))


  randVecs4 <- PCMParamRandomVecParams(
    o = model.ab.123, k = k, R = R, n = 1)

  test_that("randVecs4 is 1-row matrix", {
    expect_true(is.matrix(randVecs4))
    expect_equal(nrow(randVecs4), 1L)
  })

  randVecs5 <- PCMParamRandomVecParams(
    o = model.ab.123, k = k, R = R, n = 0)

  test_that("randVecs5 is 0-row matrix", {
    expect_true(is.matrix(randVecs5))
    expect_equal(nrow(randVecs5), 0L)
  })

}

