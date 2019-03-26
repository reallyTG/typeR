library(uGMAR)
context("check stationary and identification conditions")

params11 <- c(1, 0.9, 1, 10) # StMAR
params12 <- c(0.8, 0.5, 0.5, 2, -1, 0.1, 0.6)
params12_2 <- c(2, -1, 0.1, 0.8, 0.5, 0.5, 0.4, 12, 30) # StMAR
params22 <- c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.6)
params13 <- c(0.1, 0.99, 0.1, 0.2, -0.99, 0.2, 0.3, 0.01, 0.3, 0.5, 0.5)
params23 <- c(0.1, 0.1, 0.1, 0.1, 0.2, 0.5, 0.5, 0.2, 0.3, 0.3, 0.3, 0.3, 0.8, 0.05, 11, 12, 13) # StMAR
params14gs <- c(1, 0.1, 1, 2, 0.2, 2, 3, 0.3, 3, 4, 0.4, 4, 0.3, 0.4, 0.2, 30, 40) # M1=2, M2=2
params23gs <- c(1, 0.9, 0.1, 1, 2, 0.2, 0.2, 2, 3, 0.3, 0.3, 3, 0.2, 0.5, 20, 30) # M1=1, M2=2
params12gs <- c(1, 0.1, 1, 2, 0.2, 2, 0.1, 3) # M1=1, M2=1

params12r <- c(0.1, 0.1, 1, 0.1, 0.1, 0.6, 11, 12) # StMAR
params22r <- c(0.1, 0.2, 0.99, 0.01, 0.1, 0.2, 0.99)
params23r <- c(0.1, 0.3, 0.4, -0.4, 0.3, 1, 2, 3, 0.5, 0.1, 100, 112, 130) # StMAR
params13r <- c(1, 2, 3, 0.99999, 1, 2, 3, 0.2, 0.15)
params23r2 <- c(0.1, 0.2, 0.3, 0.9, 0.2, 0.1, 0.2, 0.3, 0.6, 0.3)
params22gsr <- c(1, 2, 0.3, 0.3, 1, 2, 0.2, 10) # M1=1, M2=1
params13gsr <- c(1, 2, 3, 0.01, 1, 2, 3, 0.3, 0.2, 10) # M1=2, M2=1
params14gsr <- c(1, 2, 3, 4, 0.1, 1, 2, 3, 4, 0.5, 0.3, 0.05, 30, 40) # M1=2, M2=2

test_that("isStationary gives correct answer", {
  expect_true(isStationary_int(1, 1, params11))
  expect_true(isStationary_int(1, 1, params11, restricted=TRUE))
  expect_false(isStationary_int(1, 2, params12))
  expect_true(isStationary_int(2, 2, params22))
  expect_true(isStationary_int(1, 3, params13))
  expect_false(isStationary_int(2, 3, params23))
  expect_false(isStationary_int(1, 2, params12r, restricted=TRUE))
  expect_false(isStationary_int(2, 2, params22r, restricted=TRUE))
  expect_true(isStationary_int(2, 3, params23r, restricted=TRUE))
  expect_true(isStationary_int(1, 3, params13r, restricted=TRUE))
  expect_false(isStationary_int(2, 3, params23r2, restricted=TRUE))
  expect_true(isStationary_int(1, c(2, 2), params14gs))
  expect_false(isStationary_int(2, c(1, 2), params23gs))
  expect_true(isStationary_int(1, c(1,1), params12gs))
  expect_true(isStationary_int(2, c(1,1), params22gsr, restricted=TRUE))
  expect_true(isStationary_int(1, c(2,1), params13gsr, restricted=TRUE))
  expect_true(isStationary_int(1, c(2,2), params14gsr, restricted=TRUE))
})

test_that("isIdentifiable gives correct answer", {
  expect_true(isIdentifiable(1, 1, params11, model="StMAR"))
  expect_true(isIdentifiable(1, 1, params11, model="StMAR", restricted=TRUE))
  expect_true(isIdentifiable(1, 2, params12))
  expect_false(isIdentifiable(1, 2, params12_2, model="StMAR"))
  expect_false(isIdentifiable(2, 2, params22))
  expect_false(isIdentifiable(1, 3, params13))
  expect_false(isIdentifiable(2, 3, params23, model="StMAR"))
  expect_true(isIdentifiable(1, 2, params12r, model="StMAR", restricted=TRUE))
  expect_true(isIdentifiable(2, 2, params22r, restricted=TRUE))
  expect_false(isIdentifiable(2, 3, params23r, model="StMAR", restricted=TRUE))
  expect_false(isIdentifiable(1, 3, params13r, restricted=TRUE))
  expect_true(isIdentifiable(2, 3, params23r2, restricted=TRUE))
  expect_false(isIdentifiable(1, c(2,2), params14gs, model="G-StMAR"))
  expect_true(isIdentifiable(2, c(1,2), params23gs, model="G-StMAR"))
  expect_true(isIdentifiable(1, c(1,1), params12gs, model="G-StMAR"))
  expect_true(isIdentifiable(2, c(1,1), params22gsr, model="G-StMAR", restricted=TRUE))
  expect_true(isIdentifiable(1, c(2,1), params13gsr, model="G-StMAR", restricted=TRUE))
  expect_false(isIdentifiable(1, c(2,2), params14gsr, model="G-StMAR", restricted=TRUE))
})

