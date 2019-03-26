#rm(list=ls())
require(testthat)
library(deepgmm)
y <- mtcars
layers <- 3
k <- c(3, 4, 6)
r <- c(3, 2, 1)
it <- 50
eps <- 0.001
seed <- 2
init <- "random"

test_that("scaled data - three layers", {
  skip_on_cran()

  set.seed(seed)
  y <- scale(y)
  model <- deepgmm(y = y, layers = layers, k = k, r = r,
                    it = it, eps = eps, init = init)

  expect_that(model, is_a("dgmm"))
  expect_named(model, c("H", "w", "mu", "psi", "lik", "bic",
  	                    "aic", "clc", "icl_bic", "s", "h",
                        "k", "r", "numobs", "layers",  "call"))

  n <- nrow(y)
  p <- ncol(y)

  expect_that(layers, equals(model$layers))
  expect_that(n, equals(model$numobs))
  expect_that(k, equals(model$k))
  expect_that(r, equals(model$r))

  rp <- c(p, r)

  for (j in 1 : layers) {
    expect_length(model$s[, j], n)
    expect_length(model$w[[j]], k[j])

    expect_equal(ncol(model$mu[[j]]), k[j])
    expect_equal(nrow(model$mu[[j]]), rp[j])

    for (i in 1 : model$k[j]) {
      expect_equal(nrow(cbind(model$H[[j]][i,,, drop = TRUE])), rp[j])
      expect_equal(ncol(cbind(model$H[[j]][i,,, drop = TRUE])), rp[j + 1])

      expect_equal(nrow(cbind(model$psi[[j]][i,,, drop = TRUE])), rp[j])
      expect_equal(ncol(cbind(model$psi[[j]][i,,, drop = TRUE])), rp[j])
    }
  }

  expect_is(model$lik,'numeric')
  expect_is(model$bic,'numeric')
  expect_is(model$aic,'numeric')
  expect_is(model$clc,'numeric')
})

context("init_est  = ppca")
test_that("scaled data - three layers", {
  skip_on_cran()

  set.seed(seed)
  model <- deepgmm(y = mtcars, layers = layers, k = k, r = r,
                    it = it, eps = eps, init = init, init_est = "ppca")

  expect_that(model, is_a("dgmm"))
  expect_named(model, c("H", "w", "mu", "psi", "lik", "bic",
  	                    "aic", "clc", "icl_bic", "s", "h",
                        "k", "r", "numobs", "layers",  "call"))
  set.seed(seed)
  y <- iris[, -5]
  model <- deepgmm(y = y, layers = layers, k = k, r = r,
                    it = it, eps = eps, init = init, init_est = "ppca")

  expect_that(model, is_a("dgmm"))
  expect_named(model, c("H", "w", "mu", "psi", "lik", "bic",
  	                    "aic", "clc", "icl_bic", "s", "h",
                        "k", "r", "numobs", "layers",  "call"))
})
                      
