context("test diff.xy")

test_that("test diff.xy",{

  res <- diff.xy(2.4,6.7)
  expect_equal(res, (6.7 - 2.4))

  res <- diff.xy(8.23,3.5)
  expect_equal(res, (8.23 - 3.5))

  res <- diff.xy(4.3,4.3)
  expect_equal(res, (4.3 - 4.3))

})



context("test cal.eigen.fit")

test_that("test cal.eigen.fit",{

  X <- c(2.7668157, 1.8931580, 1.8859049, 1.0575971, 1.0329016, 0.9095669,
         0.6395215, 0.5073142, 0.3205904, 0.3125665)

  res <- cal.eigen.fit(X)

  expected_vec <- c(0.379450739, 0.003838584, 0.578408288, 0.023627539,
                    0.127158683, 0.352248264, 0.231589695, 0.458966294,
                    0.025346914)

  expect_length(res,9)
  expect_equal(round(res,5), round(expected_vec,5))
  expect_type(res, "double")

})



context("test diff.eigen.fit")

test_that("test diff.eigen.fit",{

  X <- sort(c(2.7668157, 1.8931580, 1.8859049, 1.0575971, 1.0329016, 0.9095669,
         0.6395215, 0.5073142, 0.3205904, 0.3125665), decreasing = TRUE)

  res <- diff.eigen.fit(X)

  expected_vec <- c(-0.9690304, -5.5626540, -0.5474752, -3.7453432)

  expect_length(res,4)
  expect_equal(round(res,5), round(expected_vec,5))
  expect_type(res, "double")

})



context("test do.glm")

test_that("test do.glm",{

  PC <- matrix(runif(300, min = 0, max = 3),ncol = 3)
  X <- sample(c(0,1,2), size = 100, replace = T)

  method <- "linear"
  res <- do.glm(X,PC,method)
  expect_length(res,100)
  expect_type(res, "double")

  method <- "poisson"
  res <- do.glm(X,PC,method)
  expect_length(res,100)
  expect_type(res, "double")

  # method <- "negative.binomial"
  # res <- do.glm(X,PC,method)
  # expect_length(res,100)
  # expect_type(res, "double")

})



context("test replace.missing")

test_that("test replace.missing",{

  X <- runif(20, min = 0, max = 3)
  X[c(2,4,8,13,17)] <- NA
  missing.char <- NA
  replace.char <- rep(0,20)
  res <- replace.missing(X, missing.char, replace.char)
  expect_length(res,20)
  expect_type(res, "double")

})
