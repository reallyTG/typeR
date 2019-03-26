


test_that("multivariate Gaussian kernel", {

  dat <- mtcars
  n <- nrow(dat)
  m <- ncol(dat)

  expect_silent(rmvg(10, as.matrix(dat)))

  expect_silent(rmvg(10, as.numeric(dat[1,]), bw = 1))
  expect_silent(rmvg(10, dat[1, ], bw = 1))
  expect_silent(rmvg(10, dat[1, , drop = FALSE], bw = 1))

  set.seed(0xBEEF)
  x <- rmvg(10, as.numeric(dat[1,]), bw = 1)
  set.seed(0xBEEF)
  y <- rmvg(10, dat[1,], bw = 1)
  expect_equal(x, y, check.attributes = FALSE)

  expect_silent(rmvg(10, dat, bw = 0))
  expect_silent(rmvg(10, dat, bw = 1))
  expect_silent(rmvg(10, dat, bw = matrix(0, m, m)))
  expect_silent(rmvg(10, dat, bw = rep(0, m)))
  expect_silent(rmvg(10, dat, bw = diag(cov(dat))))

  expect_error(rmvg(10, dat, bw = matrix(1, 2, 2)))
  expect_error(rmvg(10, dat, bw = matrix(NA, m, m)))
  expect_error(rmvg(10, dat, bw = matrix(Inf, m, m)))

  expect_silent(rmvg(10, dat, weights = rep(1/n, n)))
  expect_silent(rmvg(10, dat, weights = 1))
  expect_silent(rmvg(10, dat, weights = rep(1, n)))

  expect_error(rmvg(10, dat, weights = rep(-1, n)))
  expect_error(rmvg(10, dat, weights = rep(NA, n)))
  expect_error(rmvg(10, dat, weights = rep(Inf, n)))

  expect_silent(rmvg(10, dat, adjust = 1))
  expect_silent(rmvg(10, dat, adjust = 1:10))

  expect_error(rmvg(10, dat, adjust = NA))

  expect_silent(rmvg(10, dat, adjust = 0))

  expect_error(rmvg(10, dat, adjust = Inf))

})



test_that("compare results of rmvk and rmvg", {

  skip_on_cran()

  if ( requireNamespace("cramer", quietly = TRUE) ) {

    library(cramer)

    set.seed(0xBEEF)

    bw <- diag(bw.silv(mtcars))
    x <- rmvk(500, mtcars, kernel = "gaussian", bw = sqrt(bw))
    y <- rmvg(500, mtcars, bw = bw)

    stopifnot(dim(x) == dim(y))

    stopifnot(cramer.test(x, y)$result == 0)

  }

})
