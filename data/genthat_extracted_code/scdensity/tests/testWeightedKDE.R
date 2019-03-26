library(scdensity)
context("Components of weighted or adjusted KDE methods")

test_that("BuildConCheckGrid works correctly", {
  # ng not specified, not symmetric. Bandwidth large.
  P <- list(x=seq(-3,3,length.out=100),
            h=0.25,
            constraints="unimodal")
  Pout <- BuildConCheckGrid(P)
  expect_equal(length(Pout$g), 100)
  expect_lt(Pout$g[1], min(P$x))
  expect_gt(Pout$g[100], max(P$x))
  # ng not specified, not symmetric, bandwidth small
  P$h <- 0.01
  Pout <- BuildConCheckGrid(P)
  expect_gt(length(Pout$g), 100)
  # ng specified
  P$ng <- 201
  Pout <- BuildConCheckGrid(P)
  expect_equal(length(Pout$g), 201)
  # symmetric
  P$constraints <- "symmetric"
  P$PoS <- 1
  Pout <- BuildConCheckGrid(P)
  len <- length(Pout$g)
  expect_equal(Pout$g[1] + Pout$g[len], 2*P$PoS)
  expect_equal(len %% 2, 0)
})



