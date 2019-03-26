
test_that("kernelboot function", {

  fun1 <- function(data) coef(lm(mpg ~ ., data = data))
  fun2 <- function(data) mean(data)
  fun3 <- function(data) data
  fun_err <- function(data) stop()


  dat <- mtcars
  datMtx <- as.matrix(dat)

  expect_message(expect_error(kernelboot(dat, fun_err, R = 10)))

  expect_silent(kernelboot(dat, fun1, R = 10))
  expect_silent(kernelboot(dat$mpg, fun2, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, fun3, R = 10, kernel = "gaussian"))

  # this test behaves strangely on Windows
  # expect_silent(kernelboot(dat, fun1, R = 10, parallel = TRUE))

  # standard bootstrap
  expect_equal(kernelboot(dat, fun1, R = 10, kernel = "gaussian", ignore = colnames(dat))$param$kernel, "none")
  expect_equal(kernelboot(dat, fun1, R = 10, bw = 0)$param$kernel, "none")
  expect_equal(kernelboot(dat$mpg, fun2, R = 10, bw = 0)$param$kernel, "none")
  expect_equal(kernelboot(dat, fun1, R = 10, kernel = "none")$param$kernel, "none")
  expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = "none")$param$kernel, "none")
  expect_equal(kernelboot(dat, fun1, R = 10, kernel = "none")$type, "multivariate")
  expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = "none")$type, "univariate")

  kernels <- c("multivariate", "gaussian", "epanechnikov", "rectangular",
               "triangular", "biweight", "cosine", "optcosine", "none")

  for (k in kernels) {

    expect_silent(kernelboot(dat, identity, R = 10, kernel = substr(k, 1, 1), bw = 1))
    expect_silent(kernelboot(matrix(0, 0L, 0L), identity, R = 10, kernel = k, bw = 1))
    expect_silent(kernelboot(matrix(0, 0L, 1L), identity, R = 10, kernel = k, bw = 1))
    expect_silent(kernelboot(matrix(0, 1L, 0L), identity, R = 10, kernel = k, bw = 1))

    expect_equal(kernelboot(dat, fun1, R = 10, kernel = k)$param$kernel, k)
    expect_equal(kernelboot(datMtx, colMeans, R = 10, kernel = k)$param$kernel, k)

    # handling single-column matrix
    expect_equal(kernelboot(dat[, 1, drop = FALSE], colMeans, R = 10, kernel = k)$param$kernel, k)
    expect_equal(kernelboot(datMtx[, 1, drop = FALSE], colMeans, R = 10, kernel = k)$param$kernel, k)

  }

  expect_equal(kernelboot(dat, fun1, R = 10, kernel = "multivariate")$type, "multivariate")

  # ignore multivariate and simple bootstrap
  for (k in kernels[-c(1L, length(kernels))]) {

    expect_warning(kernelboot(numeric(0), identity, R = 10, kernel = k, bw = 1))
    expect_equal(kernelboot(dat, fun1, R = 10, kernel = k)$type, "product")
    expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = k)$param$kernel, k)
    expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = k)$type, "univariate")

  }

  expect_message(expect_equal(kernelboot(dat$mpg, fun2, R = 10)$param$kernel, "gaussian"))
  expect_message(expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = "multivariate")$param$kernel, "gaussian"))

  expect_equal(kernelboot(dat$mpg, fun2, R = 10, kernel = "multivariate")$type, "univariate")

  expect_error(kernelboot(as.list(1:10), fun2, R = 10))

  dat[5, 1] <- NA

  expect_error(kernelboot(dat, fun1, R = 10))
  expect_error(kernelboot(dat$mpg, fun2, R = 10))
  expect_error(kernelboot(dat$mpg, fun3, R = 10))


  dat <- mtcars
  dat[5, 1] <- Inf

  expect_error(kernelboot(dat, fun1, R = 10))
  expect_error(kernelboot(dat$mpg, fun2, R = 10))
  expect_error(kernelboot(dat$mpg, fun3, R = 10))


  dat <- mtcars
  dat[] <- 0

  expect_silent(kernelboot(dat, fun1, R = 10))
  expect_silent(kernelboot(dat$mpg, fun2, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, fun3, R = 10, kernel = "gaussian"))

  dat <- mtcars
  n <- nrow(dat)
  k <- ncol(dat)
  w <- rep(1, n)

  expect_silent(kernelboot(dat, fun1, weights = w, R = 10))
  expect_silent(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  w <- 1

  expect_silent(kernelboot(dat, fun1, weights = w, R = 10))
  expect_silent(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  w <- rep(NA, n)

  expect_error(kernelboot(dat, fun1, weights = w, R = 10))
  expect_error(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  w <- rep(-Inf, n)

  expect_error(kernelboot(dat, fun1, weights = w, R = 10))
  expect_error(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))

  w <- rep(Inf, n)

  expect_error(kernelboot(dat, fun1, weights = w, R = 10))
  expect_error(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  w <- rep(1/n, n-1)

  expect_error(kernelboot(dat, fun1, weights = w, R = 10))
  expect_error(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  w <- rep(1/n, n+1)

  expect_error(kernelboot(dat, fun1, weights = w, R = 10))
  expect_error(kernelboot(dat$mpg, weights = w, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, weights = w, fun3, R = 10, kernel = "gaussian"))


  expect_silent(kernelboot(dat, fun1, bw = diag(k), R = 10))
  expect_silent(kernelboot(dat, fun1, bw = rep(1, k), R = 10))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun2, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun3, R = 10, kernel = "gaussian"))


  expect_error(kernelboot(dat, fun1, bw = rep(-1, k), R = 10))
  expect_error(kernelboot(dat$mpg, bw = -1, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = -1, fun3, R = 10, kernel = "gaussian"))


  expect_error(kernelboot(dat, fun1, bw = matrix(NA, k, k), R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(NA, k), R = 10))
  expect_error(kernelboot(dat$mpg, bw = NA, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = NA, fun3, R = 10, kernel = "gaussian"))


  expect_error(kernelboot(dat, fun1, bw = matrix(Inf, k, k), R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(Inf, k), R = 10))
  expect_error(kernelboot(dat$mpg, bw = Inf, fun2, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = Inf, fun3, R = 10, kernel = "gaussian"))


  a <- 1

  expect_silent(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_silent(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))



  a <- -1

  expect_error(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_error(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))



  a <- NA

  expect_error(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_error(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))



  a <- Inf

  expect_error(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_error(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))


  a <- 1:10

  expect_silent(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_silent(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))


  a <- matrix(1, 10, 10)

  expect_error(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_error(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))


  a <- as.data.frame(matrix(1, 10, 10))

  expect_error(kernelboot(dat, fun1, bw = diag(k), adjust = a, R = 10))
  expect_error(kernelboot(dat, fun1, bw = rep(1, k), adjust = a, R = 10))
  expect_error(kernelboot(dat$mpg, bw = 1, fun2, adjust = a, R = 10, kernel = "gaussian"))
  expect_error(kernelboot(dat$mpg, bw = 1, fun3, adjust = a, R = 10, kernel = "gaussian"))


  dat <- mtcars

  expect_silent(kernelboot(dat, fun1, R = 10, kernel = "cosine"))
  expect_silent(kernelboot(dat$mpg, fun2, R = 10, kernel = "cosine"))
  expect_silent(kernelboot(dat$mpg, fun3, R = 10, kernel = "cosine"))


  dat <- mtcars

  # expect_message(kernelboot(dat, fun1, R = 10, ignore = colnames(dat)))
  expect_silent(kernelboot(dat$mpg, fun2, R = 10, ignore = colnames(dat), kernel = "gaussian"))
  expect_silent(kernelboot(dat$mpg, fun3, R = 10, ignore = colnames(dat), kernel = "gaussian"))

})

