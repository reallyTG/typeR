library(SuperGauss)
## require(testthat)
source("SuperGauss-test-functions.R")
context("Solve")

## N <- 10
## d <- 2
## acf <- acf.get.SGtest(N, type = "exp", dT = .5)
## Toep <- Toeplitz(acf = acf)
## X <- matrix(rnorm(N * d), N, d)
## Y <- solve(Toep, X)

test_that("Toeplitz-matrix inversion", {
  N <- round(abs(rnorm(n = 1, mean = 100, sd = 10)))
  d <- round(abs(rnorm(n = 1, mean = 10, sd = 3)))
  Toep <- Toeplitz(N)
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          dT = c(1/60, 1/30, 1/15), b = c(TRUE, FALSE))
  ncase <- nrow(case.par)
  X <- matrix(rnorm(N * d), N, d)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf <- acf.get.SGtest(N, type, dT)
    acf.mat <- toeplitz(acf)
    Toep$setAcf(acf)
    if(cp$b) {
      expect_equal(acf.mat %*% solve(Toep, X), X, tolerance = 1e-5)
    } else {
      expect_equal(Toep %*% solve(Toep), diag(N), tolerance = 1e-5)
    }
  }
})
