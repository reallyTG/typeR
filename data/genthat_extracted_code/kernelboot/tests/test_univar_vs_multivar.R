

set.seed(1)

kernels <- c("gaussian", "epanechnikov", "rectangular",
             "triangular", "biweight", "cosine", "optcosine")

N <- 1000


test_that("single column multivariate kernels = univariate kernels", {

  skip_on_cran()

  dat <- mtcars[, 1, drop = FALSE]

  for (k in kernels) {

    x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = FALSE)
    y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = FALSE))
    expect_true(suppressWarnings(ks.test(x, y)$p.value >= 0.05))

    x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = TRUE)
    y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = TRUE))
    expect_true(suppressWarnings(ks.test(x, y)$p.value >= 0.05))

  }


  ## Not run:

  # if ( requireNamespace("cramer", quietly = TRUE) ) {
  #
  #   library(cramer)
  #
  #   dat <- mtcars[, 1, drop = FALSE]
  #
  #   for (k in kernels) {
  #
  #     x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = FALSE)
  #     y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = FALSE))
  #     expect_true(cramer.test(x, y)$result == 0)
  #
  #     x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = TRUE)
  #     y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = TRUE))
  #     expect_true(cramer.test(x, y)$result == 0)
  #
  #   }
  #
  # }

  ## End(Not run)

})


test_that("marginal distributions of multivariate kernels = univariate kernels", {

  skip_on_cran()

  dat <- mtcars

  for (k in kernels) {

    x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = FALSE)
    y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = FALSE)[, 1])
    expect_true(suppressWarnings(ks.test(x, y)$p.value >= 0.05))

    x <- ruvk(N, drop(dat[, 1]), kernel = k, bw = 2, shrinked = TRUE)
    y <- drop(rmvk(N, dat,       kernel = k, bw = 2, shrinked = TRUE)[, 1])
    expect_true(suppressWarnings(ks.test(x, y)$p.value >= 0.05))

  }

})




