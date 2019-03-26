context("rcpp")

test_that("compare previous dctMatrix and rcpp implementation", {
  n <- 10

  r_dctMatrix <- function(n){
    dctMat <- matrix(0, nrow = n, ncol = n)
    for (i in 1:n) {
      for (j in 1:n) {
        if (i == 1) {
          dctMat[i, j] <- 1 / sqrt(n)
        }
        if (i > 1) {
          dctMat[i, j] <- sqrt(2 / n) * cos((2 * (j - 1) + 1) * (i - 1) * pi / (2 * n))
        }
      }
    }
    return(dctMat)
  }

  expect_equal(r_dctMatrix(n), mrbsizeR::dctMatrix(n))
})


test_that("compare previous eigenLaplace and rcpp implementation", {
  r_eigenLaplace <- function(mm, nn) {

    N <- mm * nn
    Mu <- rep(0, N)
    In <- seq(0, mm - 1, 1)
    Im <- seq(0, nn - 1, 1)
    In <- t(In)
    Im <- t(Im)

    mu <- 2 - 2 * cos(pi * Im / nn)
    lambda <- 2 - 2 * cos(pi * In / mm)

    for (k in 1:nn) {
      for (s in 1:mm) {
        Mu[(k - 1) * mm + s] <- lambda[s] + mu[k]
      }
    }

    return(Mu)
  }

  expect_equal(r_eigenLaplace(20,20), mrbsizeR::eigenLaplace(20,20))
})
