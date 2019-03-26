context("continuous_ss_checks")

test_that("Test 2.1", {
  ss <- c(918, 401, 259, 918, 918)
  SPP <- c(36.72, 16.04, 10.36, 36.72, 36.72)
  test <- pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=.6)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 2.2", {
  ss <- c(574, 351, 259, 574, 574)
  SPP <- c(22.96, 14.04, 10.36, 22.96, 22.96)
  test <- pmsampsize(type="c",rsquared=0.3,parameters=25,intercept=1.9,sd=.6)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 2.3", {
  ss <- c(1924, 801, 284, 1924, 1924)
  SPP <- c(38.48, 16.02, 5.68, 38.48, 38.48)
  test <- pmsampsize(type="c",rsquared=0.2,parameters=50,intercept=1.9,sd=.6)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 2.4", {
  ss <- c(918, 401, 259, 918, 918)
  SPP <- c(36.72, 16.04, 10.36, 36.72, 36.72)
  test <- pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=10,sd=.6)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 2.5", {
  ss <- c(918, 401, 259, 918, 918)
  SPP <- c(36.72, 16.04, 10.36, 36.72, 36.72)
  test <- pmsampsize(type="c",rsquared=0.2,parameters=25,intercept=1.9,sd=2)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 2.6", {
  ss <- c(1264, 1001, 334, 1264, 1264)
  SPP <- c(12.64, 10.01, 3.34, 12.64, 12.64)
  test <- pmsampsize(type="c",rsquared=0.5,parameters=100,intercept=1.9,sd=2)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,5]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})


