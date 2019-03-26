library(SuperGauss)
library(mvtnorm)
source("SuperGauss-test-functions.R")
context("Density")

test_that("GSchur gives right PDF", {
  N <- round(abs(rnorm(n = 1, mean = 20, sd = 5)))
  d <- round(abs(rnorm(n = 1, mean = 10, sd = 3)))
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          dT = c(1/60, 1/30, 1/15))
  ncase <- nrow(case.par)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf <- acf.get.SGtest(N, type, dT)
    Mu <- matrix(rnorm(N * d), N, d)
    X <- rSnorm(n = d, acf = acf, fft = FALSE) + Mu
    ld1 <- dSnorm(X = X, mu = Mu, acf = acf, log = TRUE)
    ld2 <- sapply(1:d, function(jj) {
      dmvnorm(x = X[,jj], mean = Mu[,jj], sigma = toeplitz(acf),
              log = TRUE)
    })
    expect_equal(ld1, ld2)
  }
})

test_that("Durbin-Levinson gives right PDF", {
  N <- round(abs(rnorm(n = 1, mean = 20, sd = 5)))
  d <- round(abs(rnorm(n = 1, mean = 10, sd = 3)))
  case.par <- expand.grid(type = c("exp", "exp2", "fbm", "matern"),
                          dT = c(1/60, 1/30, 1/15))
  ncase <- nrow(case.par)
  for(ii in 1:ncase){
    cp <- case.par[ii, ]
    type <- as.character(cp$type)
    dT <- cp$dT
    acf <- acf.get.SGtest(N, type, dT)
    Mu <- matrix(rnorm(N * d), N, d)
    X <- rSnorm(n = d, acf = acf, fft = FALSE) + Mu
    ld1 <- dSnormDL(X = X, mu = Mu, acf = acf, log = TRUE)
    ld2 <- sapply(1:d, function(jj) {
      dmvnorm(x = X[,jj], mean = Mu[,jj], sigma = toeplitz(acf),
              log = TRUE)
    })
    expect_equal(ld1, ld2)
  }
})
