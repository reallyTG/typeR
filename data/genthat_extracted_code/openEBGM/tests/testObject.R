context("Object-oriented Features")

data(caers)
proc <- processRaw(caers)

theta <- c(3.25280367, 0.39983376, 2.02490400, 1.90726819, 0.06536416)
theta_list <- list(estimates = theta)

obj1 <- ebScores(processed = proc, hyper_estimate = theta_list, quantiles = NULL)
obj2 <- ebScores(processed = proc, hyper_estimate = theta_list)

testthat::test_that("Checking the object's size", {
  expect_equal(length(obj1), 2)
  expect_equal(length(obj2), 3)
  expect_equal(ncol(obj1$data), 7)
  expect_equal(ncol(obj2$data), 9)
  expect_equal(nrow(obj1$dat), nrow(proc))
  expect_equal(nrow(obj2$dat), nrow(proc))
})

testthat::test_that("Checking 'data' column names", {
  expect_identical(colnames(obj1$data), c("var1", "var2", "N", "E", "RR", "PRR", "EBGM"))

  expect_identical(colnames(obj2$data), c("var1", "var2", "N", "E", "RR", "PRR", "EBGM",
                                          "QUANT_05", "QUANT_95"))
})

proc2 <- proc
names(proc2) <- c("N", "E")

testthat::test_that("do errors for ebScores() get correctly printed?", {
  expect_error(ebScores(proc, hyper_estimate = theta_list, quantiles = c("5", "95")),
               "'quantiles' must be NULL or a numeric vector of quantiles",
               fixed = TRUE)
  expect_error(ebScores(proc, hyper_estimate = theta),
               "'hyper_estimate' must be the list output by autoHyper()",
               fixed = TRUE)
  expect_error(ebScores(proc, hyper_estimate = list(estimate = theta)),
               "'hyper_estimate' must be a list containing an element of hyperparameter
         estimates. Was it actually calculated by autoHyper()?",
               fixed = TRUE)
  expect_error(ebScores(theta, hyper_estimate = theta_list),
               "'processed' must be a data frame from processRaw()",
               fixed = TRUE)
  expect_error(ebScores(proc2, hyper_estimate = theta_list),
               "'processed' dataframe does not have 'var' variables. Was this dataframe
         actually created by processRaw()?",
               fixed = TRUE)
})
