context("Model estimation")

test_that("getSiteStayTimes", {
  fit <- readRDS("testdata/test_fit.rds")
  expect_is(fit, "TemporalIso")
  
  result <- getSiteStayTimes(fit, siteMeans = c(-10, -8), siteSigma = c(1, 1))
  expect_equal(length(result), 2)
  expect_is(result, "list")
  
  intervalLengths <- c(1, 2, 3, 4, 5, 6)
  result2 <- getSiteStayTimes(fit, intervalLengths = intervalLengths,
                             siteMeans = c(-10, -8), siteSigma = c(1, 1))
  expect_equal(length(result2), 2)
  expect_is(result2, "list")
  expect_equal(sum(result2$stayTimes), sum(intervalLengths))
})

test_that("getSiteStayTimesWrongInputs", {
  fit <- readRDS("testdata/test_fit.rds")
  expect_is(fit, "TemporalIso")
  
  expect_error(getSiteStayTimes(fit,
                             siteMeans = c(-10, -8), siteSigma = c(1, 2, 3)))
  expect_error(getSiteStayTimes(fit,
                                siteMeans = c(-10), siteSigma = c(1)))
  
  intervalLengths <- c(1, 2, 3, 4, 5)
  expect_error(getSiteStayTimes(fit, intervalLengths = intervalLengths,
                                siteMeans = c(-10, -8), siteSigma = c(1, 1)))
  
})
