context("Plotting")

test_that("getShiftIndex", {
  fit <- readRDS("testdata/test_fit.rds")
  expect_is(fit, "TemporalIso")
  
  result <- getShiftIndex(fit)
  
  expect_equal(sum(result), 0)
  expect_is(result, "logical")
  expect_equal(names(result), as.character(1:5))
  
  result <- getShiftIndex(fit, threshold = 0.45, probability = 0.5)
  expect_equal(sum(result), 1)
})

test_that("getShiftTime", {
  fit <- readRDS("testdata/test_fit.rds")
  expect_is(fit, "TemporalIso")
  
  result <- getShiftTime(fit)
  
  expect_equal(dim(result), c(0, 2))
  expect_is(result, "data.frame")
  expect_equal(names(result), c("intStart", "intEnd"))
  
  result <- getShiftTime(fit, threshold = 0.45, probability = 0.5)
  expect_equal(dim(result), c(1, 2))
  expect_equal(result$intStart, 0)
  expect_equal(result$intEnd, 1)
  
  result <- getShiftTime(fit, absolute = FALSE, threshold = 0.01)
  expect_equal(dim(result), c(5, 2))
  expect_is(result, "data.frame")
  expect_equal(names(result), c("intStart", "intEnd"))
  
  result <- getShiftTime(fit, absolute = FALSE, threshold = 0.1,
                         probability = 0.5)
  expect_equal(dim(result), c(5, 2))
  expect_equal(result$intStart, 0:4)
  expect_equal(result$intEnd, 1:5)
})