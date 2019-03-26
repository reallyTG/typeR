library(SuperGauss)
source("SuperGauss-test-functions.R")
context("Choleski")

test_that("Matrix Multiplication", {
  N <- round(abs(rnorm(n = 1, mean = 20, sd = 5)))
  d <- round(abs(rnorm(n = 1, mean = 10, sd = 3)))
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          dT = c(1/60, 1/30, 1/15))
  ncase <- nrow(case.par)
  Z <- matrix(rnorm(N * d), N, d)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf <- acf.get.SGtest(N, type, dT)
    Tz <- toeplitz(acf)
    X1 <- t(chol(Tz)) %*% Z
    X2 <- cholZX(Z = Z, acf = acf)
    expect_equal(X1/max(abs(X1)), X2/max(abs(X2)), tolerance = 1e-6)
  }
})

test_that("Matrix Solve", {
  N <- round(abs(rnorm(n = 1, mean = 20, sd = 5)))
  d <- round(abs(rnorm(n = 1, mean = 10, sd = 3)))
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          dT = c(1/60, 1/30, 1/15))
  ncase <- nrow(case.par)
  X <- matrix(rnorm(N * d), N, d)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf <- acf.get.SGtest(N, type, dT)
    Tz <- toeplitz(acf)
    Z1 <- solve(t(chol(Tz)), X)
    Z2 <- cholXZ(X = X, acf = acf)
    expect_equal(Z1/max(abs(Z1)), Z2/max(abs(Z2)), tolerance = 1e-6)
  }
})
