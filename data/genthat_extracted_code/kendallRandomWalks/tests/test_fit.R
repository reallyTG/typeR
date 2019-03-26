context("Test fit-related functions")

set.seed(17)
rKend <- rkend(function(x) 1)
some_data <- rKend(100, 0.7)

one_param <- estimate_stable_alpha(some_data)
one_param_fit <- fit_stable_alpha(some_data)

loglik_more <- full_minus_loglik(some_data)
loglik_grad <- full_loglik_gradient(some_data)

full_fit <- fit_kendall(some_data)

testthat::test_that("Fit for one parameter is okay", {
  testthat::expect_is(one_param$maximum, "numeric")
  testthat::expect_equal(one_param$maximum, 0.7, tolerance = 0.1)
})

testthat::test_that("QQ-plot works", {
  testthat::expect_output(plot(one_param_fit), regexp = NA)
})

testthat::test_that("Full minus loglik does not fail", {
  testthat::expect_output(loglik_more(c(0.7, 0, 1)), regexp = NA)
  testthat::expect_equal(is.na(loglik_more(c(0.7, 0, 1))), FALSE)
  testthat::expect_equal(any(is.na(loglik_grad(c(0.7, 0, 1)))), FALSE)
})

testthat::test_that("Fit happened", {
  testthat::expect_is(full_fit, "kendall_fit")
  testthat::expect_equal(all(!is.na(unlist(full_fit$params))), TRUE)
})

testthat::test_that("Partial fit works", {
  testthat::expect_output(fit_separate(some_data, 0.5), regexp = NA)
  testthat::expect_error(fit_separate(rep(NA, 5)))
})
