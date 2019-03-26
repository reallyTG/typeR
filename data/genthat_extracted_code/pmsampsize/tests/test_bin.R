context("binary_ss_checks")

test_that("Test 4.1", {
  ss <- c(623, 668, 221, 668)
  SPP <- c(4.52, 4.84, 1.6, 4.84)
  test <- pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.174)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 4.2", {
  ss <- c(255, 532, 221, 532)
  SPP <- c(1.85, 3.86, 1.6, 3.86)
  test <- pmsampsize(type="b", rsquared= 0.55, parameters=24, prevalence = 0.174)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 4.3", {
  ss <- c(934, 1002, 221, 1002)
  SPP <- c(4.51, 4.84, 1.07, 4.84)
  test <- pmsampsize(type="b", rsquared= 0.288, parameters=36, prevalence = 0.174)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})

test_that("Test 4.4", {
  ss <- c(623, 583, 289, 623)
  SPP <- c(6.49, 6.07, 3.01, 6.49)
  test <- pmsampsize(type="b", rsquared= 0.288, parameters=24, prevalence = 0.25)
  test_ss <- test$results_table[,1]
  test_SPP <- test$results_table[,6]
  names(test_ss) <- names(test_SPP) <- c()
  expect_equal(test_ss,ss,tolerance=1)
  expect_equal(test_SPP,SPP,tolerance=1)
})


