context("RS correspondence")

test_that("RS of inverse", {
  sigma <- c(1, 3, 6, 4, 7, 5, 2)
  PQ <- RS(sigma)
  QP <- RS(order(sigma))
  expect_identical(PQ$P, QP$Q)
  expect_identical(PQ$Q, QP$P)
})
