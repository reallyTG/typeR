context("find_lambda_one_d")

# Checks that find_lambda_one_d() and find_lambda_one_d_rcpp() return the
# same values.

my_tol <- 1e-5

lambda <- find_lambda_one_d(logf = dlnorm, log = TRUE)
ptr_lnorm <- create_xptr("logdlnorm")
mu <- 0
sigma <- 1
lambda_rcpp <- find_lambda_one_d_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma)
test_that("lambda", {
  testthat::expect_equal(lambda$lambda, lambda_rcpp$lambda, tolerance = my_tol)
})
test_that("gm", {
  testthat::expect_equal(lambda$gm, lambda_rcpp$gm, tolerance = my_tol)
})
test_that("init_psi", {
  testthat::expect_equal(lambda$init_psi, lambda_rcpp$init_psi,
                         tolerance = my_tol)
})
test_that("sd_psi", {
  testthat::expect_equal(lambda$sd_psi, lambda_rcpp$sd_psi, tolerance = my_tol)
})

