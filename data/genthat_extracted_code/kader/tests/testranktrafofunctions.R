library(kader)
context("Functions related to the rank transformation J")

test_that("J1 (with its cc-default) is 0 at 1/2", {
  expect_equal(J1(u = 1/2), 0)
})

test_that("J2 (with its cc-default) is 0 at 1/2", {
  expect_equal(J2(u = 1/2), 0)
})

test_that("cuberoot(x)^3 is equal to x for various values of x", {
  expect_equal(cuberoot(x = 0)^3, 0)
  expect_equal(cuberoot(x = 1)^3, 1)
  expect_equal(cuberoot(x = -1)^3, -1)
})

test_that("J_admissible(u) = sqrt(3)*(2u - 1) for cc = sqrt(3)", {
  uu <- seq(0, 1, length = 51)
  expect_equal(J_admissible(u = uu, cc = mean(sqrt(c(5/3, 3)))), J1(u = uu, cc = mean(sqrt(c(5/3, 3)))))
  expect_equal(J_admissible(u = uu, cc = sqrt(3)), sqrt(3)*(2*uu - 1))
  expect_equal(J_admissible(u = uu, cc = mean(sqrt(c(3, 5)))), J2(u = uu, cc = mean(sqrt(c(3, 5)))))
})

test_that("p_c for various values of c", {
  expect_identical(pc(cc = 0), 0)
  expect_identical(pc(cc = 1), -0.2)
  expect_identical(pc(cc = -1), -0.2)
  expect_equal(pc(cc = 1/3), -7/195)
  expect_equal(pc(cc = 4/3), 16/165)
  expect_true(is.infinite(pc(cc = sqrt(3))))
})

test_that("q_c(u) for various values of c", {
  uu <- seq(0, 1, length = 51)
  expect_true(all(qc(u = uu, cc = 0) == 0))
  expect_equal(qc(u = uu, cc = 1), (1 - 2*uu)/5)
  expect_identical(qc(u = 0,   cc = 1), 0.2)
  expect_identical(qc(u = 0.5, cc = 1), 0)
  expect_identical(qc(u = 1,   cc = 1), -0.2)
  expect_identical(qc(u = uu, cc = sqrt(3)), Inf*(1 - 2*uu))
})
