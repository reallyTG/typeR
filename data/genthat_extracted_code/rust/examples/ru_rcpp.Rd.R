library(rust)


### Name: ru_rcpp
### Title: Generalized ratio-of-uniforms sampling using C++ via Rcpp
### Aliases: ru_rcpp

### ** Examples

n <- 1000

# Normal density ===================

# One-dimensional standard normal ----------------
ptr_N01 <- create_xptr("logdN01")
x <- ru_rcpp(logf = ptr_N01, d = 1, n = n, init = 0.1)

# Two-dimensional standard normal ----------------
ptr_bvn <- create_xptr("logdnorm2")
rho <- 0
x <- ru_rcpp(logf = ptr_bvn, rho = rho, d = 2, n = n,
  init = c(0, 0))

# Two-dimensional normal with positive association ===================
rho <- 0.9
# No rotation.
x <- ru_rcpp(logf = ptr_bvn, rho = rho, d = 2, n = n, init = c(0, 0),
             rotate = FALSE)

# With rotation.
x <- ru_rcpp(logf = ptr_bvn, rho = rho, d = 2, n = n, init = c(0, 0))

# Using general multivariate normal function.
ptr_mvn <- create_xptr("logdmvnorm")
covmat <- matrix(rho, 2, 2) + diag(1 - rho, 2)
x <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 2, n = n, init = c(0, 0))

# Three-dimensional normal with positive association ----------------
covmat <- matrix(rho, 3, 3) + diag(1 - rho, 3)

# No rotation.
x <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 3, n = n,
             init = c(0, 0, 0), rotate = FALSE)

# With rotation.
x <- ru_rcpp(logf = ptr_mvn, sigma = covmat, d = 3, n = n,
             init = c(0, 0, 0))

# Log-normal density ===================

ptr_lnorm <- create_xptr("logdlnorm")
mu <- 0
sigma <- 1
# Sampling on original scale ----------------
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, d = 1, n = n,
             lower = 0, init = exp(mu))

# Box-Cox transform with lambda = 0 ----------------
lambda <- 0
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, d = 1, n = n,
             lower = 0, init = exp(mu), trans = "BC", lambda = lambda)

# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand
ptr_phi_to_theta_lnorm <- create_phi_to_theta_xptr("exponential")
ptr_log_j_lnorm <- create_log_j_xptr("neglog")
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, d = 1, n = n,
  init = 0.1, trans = "user", phi_to_theta = ptr_phi_to_theta_lnorm,
  log_j = ptr_log_j_lnorm)

# Gamma (alpha, 1) density ===================

# Note: the gamma density in unbounded when its shape parameter is < 1.
# Therefore, we can only use trans="none" if the shape parameter is >= 1.

# Sampling on original scale ----------------

ptr_gam <- create_xptr("logdgamma")
alpha <- 10
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
  lower = 0, init = alpha)

alpha <- 1
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
  lower = 0, init = alpha)

# Box-Cox transform with lambda = 1/3 works well for shape >= 1. -----------

alpha <- 1
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
  trans = "BC", lambda = 1/3, init = alpha)
summary(x)

# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand

lambda <- 1/3
ptr_phi_to_theta_bc <- create_phi_to_theta_xptr("bc")
ptr_log_j_bc <- create_log_j_xptr("bc")
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = n,
  trans = "user", phi_to_theta = ptr_phi_to_theta_bc, log_j = ptr_log_j_bc,
  user_args = list(lambda = lambda), init = alpha)
summary(x)

## Not run: 
##D # Generalized Pareto posterior distribution ===================
##D 
##D # Sample data from a GP(sigma, xi) distribution
##D gpd_data <- rgpd(m = 100, xi = -0.5, sigma = 1)
##D # Calculate summary statistics for use in the log-likelihood
##D ss <- gpd_sum_stats(gpd_data)
##D # Calculate an initial estimate
##D init <- c(mean(gpd_data), 0)
##D 
##D n <- 1000
##D # Mode relocation only ----------------
##D ptr_gp <- create_xptr("loggp")
##D for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
##D                  lower = c(0, -Inf)), ss, rotate = FALSE)
##D x1 <- do.call(ru_rcpp, for_ru_rcpp)
##D plot(x1, xlab = "sigma", ylab = "xi")
##D # Parameter constraint line xi > -sigma/max(data)
##D # [This may not appear if the sample is far from the constraint.]
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x1)
##D 
##D # Rotation of axes plus mode relocation ----------------
##D for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
##D                  lower = c(0, -Inf)), ss)
##D x2 <- do.call(ru_rcpp, for_ru_rcpp)
##D plot(x2, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x2)
##D 
##D # Cauchy ========================
##D 
##D ptr_c <- create_xptr("logcauchy")
##D 
##D # The bounding box cannot be constructed if r < 1.  For r = 1 the
##D # bounding box parameters b1-(r) and b1+(r) are attained in the limits
##D # as x decreases/increases to infinity respectively.  This is fine in
##D # theory but using r > 1 avoids this problem and the largest probability
##D # of acceptance is obtained for r approximately equal to 1.26.
##D 
##D res <- ru_rcpp(logf = ptr_c, log = TRUE, init = 0, r = 1.26, n = 1000)
##D 
##D # Half-Cauchy ===================
##D 
##D ptr_hc <- create_xptr("loghalfcauchy")
##D 
##D # Like the Cauchy case the bounding box cannot be constructed if r < 1.
##D # We could use r > 1 but the mode is on the edge of the support of the
##D # density so as an alternative we use a log transformation.
##D 
##D x <- ru_rcpp(logf = ptr_hc, init = 0, trans = "BC", lambda = 0, n = 1000)
##D x$pa
##D plot(x, ru_scale = TRUE)
##D 
##D # Example 4 from Wakefield et al. (1991) ===================
##D # Bivariate normal x bivariate student-t
##D 
##D ptr_normt <- create_xptr("lognormt")
##D rho <- 0.9
##D covmat <- matrix(c(1, rho, rho, 1), 2, 2)
##D y <- c(0, 0)
##D 
##D # Case in the top right corner of Table 3
##D x <- ru_rcpp(logf = ptr_normt, mean = y, sigma1 = covmat, sigma2 = covmat,
##D   d = 2, n = 10000, init = y, rotate = FALSE)
##D x$pa
##D 
##D # Rotation increases the probability of acceptance
##D x <- ru_rcpp(logf = ptr_normt, mean = y, sigma1 = covmat, sigma2 = covmat,
##D   d = 2, n = 10000, init = y, rotate = TRUE)
##D x$pa
## End(Not run)




