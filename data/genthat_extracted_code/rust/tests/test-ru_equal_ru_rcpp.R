context("rpost_rcpp vs rpost")

# We check that the values simulated using ru() and ru_rcpp() are
# (close enough to) identical when they are called using the same data,
# the same prior and starting from the same random number seed.

# Set a tolerance for the comparison of the simulated values

my_tol <- 1e-5
n <- 5
seed <- 27082017

# 1. One-dimensional standard normal ----------------

set.seed(seed)
x <- ru(logf = function(x) -x ^ 2 / 2, d = 1, n = n, init = 0.1)
ptr_N01 <- create_xptr("logdN01")
set.seed(seed)
x_rcpp <- ru_rcpp(logf = ptr_N01, d = 1, n = n, init = 0.1)
test_that("N(0,1)", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})


# 2. Gamma

alpha <- 10
lambda <- 1/3

# 2a : using trans = "BC"

# ru
set.seed(seed)
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n,
        trans = "BC", lambda = 1/3, init = alpha)
# ru_rcpp
ptr_gam <- create_xptr("logdgamma")
set.seed(seed)
x_rcpp <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
             trans = "BC", lambda = 1/3, init = alpha)
test_that("Gamma: trans = BC", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})

# 2b : using trans = "user"

# ru
phi_to_theta  <- function(x, lambda) {
  ifelse(x * lambda + 1 > 0, (x * lambda + 1) ^ (1 / lambda), NA)
}
log_j <- function(x, lambda) (lambda - 1) * log(x)
lambda <- 1/3
set.seed(seed)
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n,
        trans = "user", phi_to_theta = phi_to_theta, log_j = log_j,
        user_args = list(lambda = lambda), init = alpha)
# ru_rcpp
ptr_phi_to_theta_bc <- create_phi_to_theta_xptr("bc")
ptr_log_j_bc <- create_log_j_xptr("bc")
set.seed(seed)
x_rcpp <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
                  trans = "user", phi_to_theta = ptr_phi_to_theta_bc,
                  log_j = ptr_log_j_bc, user_args = list(lambda = lambda),
                  init = alpha)
test_that("Gamma: trans = user", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})

# 3. Posterior density of Generalized Pareto parameters

# Sample data from a GP(sigma, xi) distribution
seed <- 27082017

set.seed(seed)
gpd_data <- rgpd(m = 100, xi = 0, sigma = 1)
# Calculate summary statistics for use in the log-likelihood
ss <- gpd_sum_stats(gpd_data)
# Calculate an initial estimate
init <- c(mean(gpd_data), 0)

# 3a. Rotation of axes plus mode relocation ----------------
set.seed(seed)
x <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
        lower = c(0, -Inf))

ptr_gp <- create_xptr("loggp")
for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
                      lower = c(0, -Inf)), ss)
set.seed(seed)
x_rcpp <- do.call(ru_rcpp, for_ru_rcpp)

test_that("GP: rotation", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})

# 3b. Box-Cox transformation, rotation of axes plus mode relocation -----------

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

set.seed(seed)
x <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
        lambda = lambda)
set.seed(seed)
x_rcpp <- ru_rcpp(logf = ptr_gp, ss = ss, d = 2, n = n, trans = "BC",
                  lambda = lambda_rcpp)

test_that("GP: rotation and BC", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})

# 3c. As 3b. but with strongly negative shape parameter

set.seed(46)
# Sample data from a GP(sigma, xi) distribution
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

set.seed(seed)
x <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
        lambda = lambda)
set.seed(seed)
x_rcpp <- ru_rcpp(logf = ptr_gp, ss = ss, d = 2, n = n, trans = "BC",
                  lambda = lambda_rcpp)

test_that("GP: rotation and BC, negative shape", {
  testthat::expect_equal(x$sim_vals, x_rcpp$sim_vals, tolerance = my_tol)
})

