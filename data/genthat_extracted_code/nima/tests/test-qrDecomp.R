library(nima)
context("Performing a (readable) QR matrix decomposition")

test_that("qrD performs a QR decomposition that reconstructs original matrix", {
  hilbert <- function(n) {
    i <- seq_len(n)
    1 / outer(i - 1, i, "+")
  }
  expect_equal(qrD(hilbert(5))$q %*% qrD(hilbert(5))$r, hilbert(5))
})

test_that("qrD performs a QR decomposition on a random matrix", {
  a <- matrix(rexp(100, rate = .1), ncol = 10)
  expect_equal(qrD(a)$q %*% qrD(a)$r, a)
})


test_that("qrD performs a QR decomposition on a non-square matrix", {
  b <- matrix(rexp(100, rate = .1), ncol = 5)
  expect_equal(qrD(b)$q %*% qrD(b)$r, b)
})
