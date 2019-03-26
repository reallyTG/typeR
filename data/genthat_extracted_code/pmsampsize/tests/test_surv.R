context("survival_ss_checks")

test_that("Test 3.1", {
  ss <- c(4286, 1306, 4286, 4286)
  SPP <- c(23.07, 7.03, 23.07, 23.07)
  test <- pmsampsize(type="s",rsquared=0.051,parameters=25,rate=0.065,timepoint=2,meanfup=2.07)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.2", {
  ss <- c(3335, 1291, 3335, 3335)
  SPP <- c(17.95, 6.95, 17.95, 17.95)
  test <- pmsampsize(type="s",rsquared=0.065,parameters=25,rate=0.065,timepoint=2,meanfup=2.07)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.3", {
  ss <- c(8572, 2611, 8572, 8572)
  SPP <- c(23.07, 7.03, 23.07, 23.07)
  test <- pmsampsize(type="s",rsquared=0.051,parameters=50,rate=0.065,timepoint=2,meanfup=2.07)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.4", {
  ss <- c(8572, 2291, 8572, 8572)
  SPP <- c(35.49, 9.48, 35.49, 35.49)
  test <- pmsampsize(type="s",rsquared=0.051,parameters=25,rate=0.1,timepoint=2,meanfup=2.07)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.5", {
  ss <- c(4286, 1306, 4286, 4286)
  SPP <- c(23.07, 7.03, 23.07, 23.07)
  test <- pmsampsize(type="s",rsquared=0.051,parameters=25,rate=0.065,timepoint=4,meanfup=2.07)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.6", {
  ss <- c(4286, 815, 4286, 4286)
  SPP <- c(44.57, 8.48, 44.57, 44.57)
  test <- pmsampsize(type="s",rsquared=0.051,parameters=25,rate=0.065,timepoint=2,meanfup=4)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.7", {
  ss <- c(5798, 1090, 5798, 5798)
  SPP <- c(57.98, 10.9, 57.98, 57.98)
  test <- pmsampsize(type="s",rsquared=0.06,parameters=40,rate=0.08,timepoint=3,meanfup=5)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.8", {
  ss <- c(2950, 367, 2950, 2950)
  SPP <- c(79.65, 9.91, 79.65, 79.65)
  test <- pmsampsize(type="s",rsquared=0.03,parameters=10,rate=0.09,timepoint=3,meanfup=3)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 3.9", {
  ss <- c(1974, 2500, 2500, 2500)
  SPP <- c(3.7, 4.69, 4.69, 4.69)
  test <- pmsampsize(type="s",rsquared=0.3,parameters=80,rate=0.03,timepoint=1,meanfup=5)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})


