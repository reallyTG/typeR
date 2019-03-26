## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

required <- c("revdbayes")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library(rust)
library(Rcpp)
# Is microbenchmark available?
got_microbenchmark <- requireNamespace("microbenchmark", quietly = TRUE)
if (got_microbenchmark) {
  library(microbenchmark)
}  
# Set the size of the simulated sample
n <- 1000

## ------------------------------------------------------------------------
# Normal density ===================

# Create a pointer to the logdN01 C++ function
# (not necessary if this was created when the file of C++ functions was sourced)
ptr_N01 <- create_xptr("logdN01")

# Use ru and ru_rcpp starting from the same random number seed and check
# that the simulated values are the same.
set.seed(47)
x_old <- ru(logf = function(x) -x ^ 2 / 2, d = 1, n = n, init = 0.1)
head(x_old$sim_vals)
set.seed(47)
x_new <- ru_rcpp(logf = ptr_N01, d = 1, n = n, init = 0.1)
head(x_new$sim_vals)

# Compare performances of ru and ru_rcpp
if (got_microbenchmark) {
  res <- microbenchmark(
    old = ru(logf = function(x) -x ^ 2 / 2, d = 1, n = n, init = 0.1),
    new = ru_rcpp(logf = ptr_N01, d = 1, n = n, init = 0.1)
  )
  print(res, signif = 4)
}

## ------------------------------------------------------------------------
# Three-dimensional normal with positive association ----------------
rho <- 0.9
covmat <- matrix(rho, 3, 3) + diag(1 - rho, 3)
# R function
log_dmvnorm <- function(x, mean = rep(0, d), sigma = diag(d)) {
  x <- matrix(x, ncol = length(x))
  d <- ncol(x)
  - 0.5 * (x - mean) %*% solve(sigma) %*% t(x - mean)
}
# Create a pointer to the logdmvnorm C++ function
ptr_mvn <- create_xptr("logdmvnorm")

if (got_microbenchmark) {
  res <- microbenchmark(
    old = ru(logf = log_dmvnorm, sigma = covmat, d = 3, n = n,
             init = c(0, 0, 0)), 
    new = ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 3, n = n,
                  init = c(0, 0, 0))
  )  
  print(res, signif = 4)
}  

## ------------------------------------------------------------------------
ptr_lnorm <- create_xptr("logdlnorm")
if (got_microbenchmark) {
  res <- microbenchmark(
   old = ru(logf = dlnorm, log = TRUE, d = 1, n = n, lower = 0, init = 0.1,
            trans = "BC", lambda = 0),
   new = ru_rcpp(logf = ptr_lnorm, mu = 0, sigma = 1, d = 1, n = n,
                 lower = 0, init = 0.1, trans = "BC", lambda = 0)
  )
  print(res, signif = 4)
}  

## ------------------------------------------------------------------------
set.seed(46)
# Sample data from a GP(sigma, xi) distribution
gpd_data <- rgpd(m = 100, xi = -0.5, sigma = 1)
# Calculate summary statistics for use in the log-likelihood
ss <- gpd_sum_stats(gpd_data)
# Calculate an initial estimate
init <- c(mean(gpd_data), 0)

## ------------------------------------------------------------------------
# Arguments for ru_rcpp
ptr_gp <- create_xptr("loggp")
for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
                 lower = c(0, -Inf)), ss)

if (got_microbenchmark) {
  res <- microbenchmark(
   old = ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
            lower = c(0, -Inf)),
   new = do.call(ru_rcpp, for_ru_rcpp)
  )
  print(res, signif = 4)
}  

## ------------------------------------------------------------------------
alpha <- 1
max_phi <- qgamma(0.999, shape = alpha)
ptr_gam <- create_xptr("logdgamma")
lambda <- find_lambda_one_d_rcpp(logf = ptr_gam, alpha = alpha,
                                 max_phi = max_phi)
lambda

## ------------------------------------------------------------------------
temp <- do.call(gpd_init, ss)
min_phi <- pmax(0, temp$init_phi - 2 * temp$se_phi)
max_phi <- pmax(0, temp$init_phi + 2 * temp$se_phi)

# Create external pointers
ptr_gp <- create_xptr("loggp")
ptr_phi_to_theta_gp <- create_phi_to_theta_xptr("gp")
# Note: log_j is set to zero by default inside find_lambda_rcpp()
lambda <- find_lambda_rcpp(logf = ptr_gp, ss = ss, d = 2, min_phi = min_phi,
                           max_phi = max_phi, user_args = list(xm = ss$xm),
                           phi_to_theta = ptr_phi_to_theta_gp)
lambda

