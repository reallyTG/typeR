context("find_lambda")

# Checks that find_lambda() and find_lambda_rcpp() return the same values.

my_tol <- 1e-5

# 1. Gamma density

alpha <- 1
max_phi <- qgamma(0.999, shape = alpha)
lambda <- find_lambda(logf = dgamma, shape = alpha, log = TRUE,
                      max_phi = max_phi)
lambda
ptr_gam <- create_xptr("logdgamma")
lambda_rcpp <- find_lambda_rcpp(logf = ptr_gam, alpha = alpha,
                                max_phi = max_phi)
lambda_rcpp

testthat::expect_equal(lambda$lambda, lambda_rcpp$lambda, tolerance = my_tol)
testthat::expect_equal(lambda$gm, lambda_rcpp$gm, tolerance = my_tol)
testthat::expect_equal(lambda$init_psi, lambda_rcpp$init_psi,
                       tolerance = my_tol)
testthat::expect_equal(lambda$sd_psi, lambda_rcpp$sd_psi, tolerance = my_tol)

# 2. Posterior density of Generalized Pareto parameters

# Sample data from a GP(sigma, xi) distribution
set.seed(47)
gpd_data <- rgpd(m = 100, xi = 0, sigma = 1)
# Calculate summary statistics for use in the log-likelihood
ss <- gpd_sum_stats(gpd_data)
# Calculate an initial estimate for phi = (phi1, phi2)
temp <- do.call(gpd_init, ss)
min_phi <- pmax(0, temp$init_phi - 2 * temp$se_phi)
max_phi <- pmax(0, temp$init_phi + 2 * temp$se_phi)

# find_lambda() -------------

phi_to_theta <- function(phi) c(phi[1], phi[2] - phi[1] / ss$xm)
log_j <- function(x) 0

lambda <- find_lambda(logf = gpd_logpost, ss = ss, d = 2, min_phi = min_phi,
                      max_phi = max_phi, phi_to_theta = phi_to_theta,
                      log_j = log_j)

# find_lambda_rcpp() -------------

ptr_gp <- create_xptr("loggp")
ptr_phi_to_theta_gp <- create_phi_to_theta_xptr("gp")
log_j <- create_log_jac_xptr("log_none_jac")
lambda_rcpp <- find_lambda_rcpp(logf = ptr_gp, ss = ss, d = 2,
                                min_phi = min_phi, max_phi = max_phi,
                                user_args = list(xm = ss$xm), log_j = log_j,
                                phi_to_theta = ptr_phi_to_theta_gp)

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

