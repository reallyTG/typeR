
test_that("univariate kernels", {

  y <- rnorm(10)
  bw <- bw.nrd0(y)
  n <- length(y)

  kernels <- c("gaussian", "epanechnikov", "rectangular",
               "triangular", "biweight", "cosine", "optcosine")

  for (k in kernels) {

    expect_silent(ruvk(10, y, kernel = substr(k, 1, 1)))
    expect_silent(ruvk(10, y, kernel = k))
    expect_warning(expect_true(all(is.na(ruvk(10, numeric(0), kernel = k, bw = 1)))))

  }

  expect_silent(ruvk(10, y, shrinked = TRUE))
  expect_silent(ruvk(10, y, shrinked = FALSE))

  expect_message(ruvk(10, y, bw = 1:10))

  expect_error(ruvk(10, y, bw = -1))
  expect_error(ruvk(10, y, bw = NA))
  expect_error(ruvk(10, y, bw = Inf))
  expect_error(ruvk(10, y, kernel = "fluffy cat"))

  expect_error(ruvk(10, y, weights = rep(-1, n)))
  expect_error(ruvk(10, y, weights = rep(Inf, n)))
  expect_error(ruvk(10, y, weights = rep(NA, n)))

  expect_error(ruvk(10, y, weights = rep(1/n, n-1)))
  expect_error(ruvk(10, y, weights = rep(1/n, n+1)))

  expect_error(ruvk(10, y, adjust = -1))
  expect_error(ruvk(10, y, adjust = NA))
  expect_error(ruvk(10, y, adjust = Inf))

})

