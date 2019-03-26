
test_that("multivariate kernels", {

  dat <- mtcars
  n <- nrow(dat)
  m <- ncol(dat)

  kernels <- c("gaussian", "epanechnikov", "rectangular",
               "triangular", "biweight", "cosine", "optcosine")

  for (k in kernels) {

    expect_silent(rmvk(10, dat, kernel = substr(k, 1, 1)))
    expect_silent(rmvk(10, dat, kernel = k))
    expect_warning(expect_true(all(is.na(rmvk(10, matrix(0, 0L, 1L), kernel = k, bw = 1)))))
    expect_warning(expect_true(ncol(rmvk(10, matrix(0, 1L, 0L), kernel = k, bw = 1)) == 0))

  }

  expect_silent(rmvk(10, as.matrix(dat)))

  expect_silent(rmvk(10, as.numeric(dat[1,]), bw = 1))
  expect_silent(rmvk(10, dat[1,], bw = 1))
  expect_silent(rmvk(10, dat[1, , drop = FALSE], bw = 1))

  set.seed(0xBEEF)
  x <- rmvk(10, as.numeric(dat[1,]), bw = 1)
  set.seed(0xBEEF)
  y <- rmvk(10, dat[1,], bw = 1)
  expect_equal(x, y, check.attributes = FALSE)

  expect_silent(rmvk(10, dat, bw = 0))
  expect_silent(rmvk(10, dat, bw = 1))
  expect_silent(rmvk(10, dat, bw = matrix(0, m, m)))
  expect_silent(rmvk(10, dat, bw = rep(0, m)))
  expect_silent(rmvk(10, dat, bw = diag(cov(dat))))

  expect_error(rmvk(10, dat, bw = matrix(1, 2, 2)))
  expect_error(rmvk(10, dat, bw = matrix(NA, m, m)))
  expect_error(rmvk(10, dat, bw = matrix(Inf, m, m)))

  expect_silent(rmvk(10, dat, weights = NULL))
  expect_silent(rmvk(10, dat, weights = rep(1/n, n)))
  expect_silent(rmvk(10, dat, weights = 1))
  expect_silent(rmvk(10, dat, weights = rep(1, n)))

  expect_error(rmvk(10, dat, weights = rep(-1, n)))
  expect_error(rmvk(10, dat, weights = rep(NA, n)))
  expect_error(rmvk(10, dat, weights = rep(Inf, n)))

  expect_silent(rmvk(10, dat, adjust = 1))
  expect_silent(rmvk(10, dat, adjust = 1:10))

  expect_error(rmvk(10, dat, adjust = NA))

  expect_silent(rmvk(10, dat, adjust = 0))

  expect_error(rmvk(10, dat, adjust = Inf))

})
