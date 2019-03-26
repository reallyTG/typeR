context("util functions")

test_that("f1 score is calculated correctly", {
  expect_equal(.f1(c(1,1,1),c(1,1,1)),1)
  expect_equal(.f1(c(1,1,1),c(0,0,1)),0.5)
  expect_equal(.f1(c(1,1,1,1,0),c(0,0,1,1,0)),2/3)
})

test_that("mcc is calculated correctly", {
  expect_equal(.mcc(c(1,1,1),c(1,1,1)),0)
  expect_equal(.mcc(c(1,1,1),c(0,0,1)),0)
  expect_equal(.mcc(c(1,1,1,1,0),c(0,0,1,1,0)),0.4082483)
  expect_equal(.mcc(c(0,0,1),c(0,0,1)),1)
  expect_equal(.mcc(c(0,0,0),c(0,0,0)),0)
  expect_equal(.mcc(c(1,1,1,1,0),c(0,0,0,0,1)),-1)
})

test_that(".score is calculated correctly", {
  expect_equal(.score(c(1,1,1,1,0),c(0,0,1,1,0),"f1"),
               .f1(c(1,1,1,1,0),c(0,0,1,1,0)))
  expect_equal(.score(c(1,1,1,1,0),c(0,0,1,1,0),"mcc"),
               .mcc(c(1,1,1,1,0),c(0,0,1,1,0)))
})


test_that(".mean2 is calculated correctly", {
  dmat <- matrix(c(1,2,1,4,3,5,2,1,3,2,1.1,2.2),nrow=4)
  expect_equal(.mean2(dmat),c(2.000, 2.750, 2.075))
  expect_equal(.mean2(dmat[1:2,1:2]),c(1.5, 4))
  expect_null(names(.mean2(dmat)))
})


test_that(".var2 is calculated correctly", {
  dmat <- matrix(c(1,2,1,4,3,5,2,1,3,2,1.1,2.2),nrow=4)
  expect_equal(.var2(dmat), c(2.0000000000, 2.9166666667, 0.6091666667))
  expect_equal(.var2(dmat[1:2,1:2]), c(0.5, 2.0))
  expect_null(names(.var2(dmat)))
})


test_that("univariate pdf is calculated correctly 1", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=2)
  expect_equal(.univariate_pdf(dmat,c(0,0,0,0),c(1,1,1,1)),
               c(2.565983e-07, 1.035191e-04), tolerance = 0.00002)

})

test_that("univariate pdf is calculated correctly 2", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=2)
  x_mean <- .mean2(dmat)
  x_sd <- .var2(dmat)
  expect_equal(.univariate_pdf(dmat,x_mean,x_sd),
               c(0.009318495, 0.009318495), tolerance = 0.00002)

})

test_that("multivariate pdf is calculated correctly 1 ", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0),nrow=4)
  x_mean <- c(0.1,0.2)
  x_sd <- matrix(c(1,0,0,1),nrow=2)
  expect_equal(.multivariate_pdf(dmat,x_mean,x_sd),
               c(0.0004699534, 0.0021061849, 0.0011558988,
                 0.1040506929), tolerance = 0.00002)

})


test_that("multivariate pdf is calculated correctly 2", {
  dmat <- matrix(c(3,1,3,1,2,3,-1,0,1,4),nrow=5)
  x_mean <- .mean2(dmat)
  x_sd <- cov(dmat)
  expect_equal(.multivariate_pdf(dmat,x_mean,x_sd),
               c(0.04533205, 0.03469015, 0.02690400,
                 0.04912076, 0.03332547), tolerance = 0.00002)

})



x1 <- c(2,3,4,5,6,7,8,9,10)
x2 <- c(22,33,44,55,66,77,88,99,110)
x <- do.call(cbind,list(x1,x2))
y <- c(0,0,0,0,0,0,0,0,1)

test_that("random data split works correctly 1", {
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(101)
  dat <- .split_data(x, y)
  expect_equal(dat$val_y,c(0,0,1))
  expect_equal(dat$train_x[,1],c(5,2,6,3,8,7))
  expect_equal(dat$val_x[,1],c(9,4,10))
})

test_that("random data split works correctly 2", {
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(232)
  dat <- .split_data(x, y, p = 0.5)
  expect_equal(dat$val_y,c(0,0,0,0,1))
  expect_equal(dat$train_x[,1],c(9,2,4,5))
  expect_equal(dat$val_x[,1],c(6,3,8,7,10))
})

test_that("non-random data split works correctly", {
  x1 <- c(2,3,4,5,6,7,8,9,10,11)
  x2 <- c(22,33,44,55,66,77,88,99,111,222)
  x <- do.call(cbind,list(x1,x2))
  y <- c(0,0,0,0,0,0,0,1,0,1)
  dat <- .split_data(x, y, random = FALSE, p = 0.66)
  expect_equal(dat$val_y,c(0,1,0,1))
  expect_equal(dat$train_x[,1],c(2,3,4,5,6,7))
  expect_equal(dat$val_x[,1],c(8,9,10,11))
})


test_that(".check_data fails when x and y are of different lengths", {
  y_1 <- c(0,0,0)
  expect_error(ad(x = x, y = y_1),
               'x and y must have the same number of observations.',
               fixed = TRUE)
})

test_that(".check_data fails matrix input contains NA", {
  x1_0 <- c(NA,3,4,5,6,7,8,9,10)
  x2_0 <- c(22,33,44,55,66,77,88,99,110)
  x_0 <- do.call(cbind,list(x1_0,x2_0))
  expect_error(ad(x = x_0, y = y),
               'NAs currently not supported for matrix input.',
               fixed = TRUE)
})


test_that(".check_data passes when data frame input contains NA", {
  x1_0 <- c(NA,3,4,5,6,7,8,9,10)
  x2_0 <- c(22,33,44,55,66,77,NA,99,110)
  x_0 <- do.call(cbind,list(x1_0,x2_0))
  dframe_0 <- data.frame(x_0,y)
  names(dframe_0) <- c("x1_0","x2_0","y")
  expect_silent(ad(y ~ x1_0 + x2_0, dframe_0))
})

