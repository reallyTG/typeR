library(rust)


### Name: ru
### Title: Generalized ratio-of-uniforms sampling
### Aliases: ru

### ** Examples

# Normal density ===================

# One-dimensional standard normal ----------------
x <- ru(logf = function(x) -x ^ 2 / 2, d = 1, n = 1000, init = 0.1)

# Two-dimensional standard normal ----------------
x <- ru(logf = function(x) -(x[1]^2 + x[2]^2) / 2, d = 2, n = 1000,
        init = c(0, 0))

# Two-dimensional normal with positive association ----------------
rho <- 0.9
covmat <- matrix(c(1, rho, rho, 1), 2, 2)
log_dmvnorm <- function(x, mean = rep(0, d), sigma = diag(d)) {
  x <- matrix(x, ncol = length(x))
  d <- ncol(x)
  - 0.5 * (x - mean) %*% solve(sigma) %*% t(x - mean)
}

# No rotation.
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = 1000, init = c(0, 0),
        rotate = FALSE)

# With rotation.
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = 1000, init = c(0, 0))

# three-dimensional normal with positive association ----------------
covmat <- matrix(rho, 3, 3) + diag(1 - rho, 3)

# No rotation.  Slow !
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 3, n = 1000,
        init = c(0, 0, 0), rotate = FALSE)

# With rotation.
x <- ru(logf = log_dmvnorm, sigma = covmat, d = 3, n = 1000,
        init = c(0, 0, 0))

# Log-normal density ===================

# Sampling on original scale ----------------
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, lower = 0, init = 1)

# Box-Cox transform with lambda = 0 ----------------
lambda <- 0
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, lower = 0, init = 0.1,
        trans = "BC", lambda = lambda)

# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, init = 0.1,
        trans = "user", phi_to_theta = function(x) exp(x),
        log_j = function(x) -log(x))

# Gamma(alpha, 1) density ===================

# Note: the gamma density in unbounded when its shape parameter is < 1.
# Therefore, we can only use trans="none" if the shape parameter is >= 1.

# Sampling on original scale ----------------

alpha <- 10
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        lower = 0, init = alpha)

alpha <- 1
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        lower = 0, init = alpha)

# Box-Cox transform with lambda = 1/3 works well for shape >= 1. -----------

alpha <- 1
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        trans = "BC", lambda = 1/3, init = alpha)
summary(x)

# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand

# Note: when phi_to_theta is undefined at x this function returns NA
phi_to_theta  <- function(x, lambda) {
  ifelse(x * lambda + 1 > 0, (x * lambda + 1) ^ (1 / lambda), NA)
}
log_j <- function(x, lambda) (lambda - 1) * log(x)
lambda <- 1/3
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        trans = "user", phi_to_theta = phi_to_theta, log_j = log_j,
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
##D # Mode relocation only ----------------
##D n <- 1000
##D x1 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
##D          lower = c(0, -Inf), rotate = FALSE)
##D plot(x1, xlab = "sigma", ylab = "xi")
##D # Parameter constraint line xi > -sigma/max(data)
##D # [This may not appear if the sample is far from the constraint.]
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x1)
##D 
##D # Rotation of axes plus mode relocation ----------------
##D x2 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
##D          lower = c(0, -Inf))
##D plot(x2, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x2)
##D 
##D # Cauchy ========================
##D 
##D # The bounding box cannot be constructed if r < 1.  For r = 1 the
##D # bounding box parameters b1-(r) and b1+(r) are attained in the limits
##D # as x decreases/increases to infinity respectively.  This is fine in
##D # theory but using r > 1 avoids this problem and the largest probability
##D # of acceptance is obtained for r approximately equal to 1.26.
##D 
##D res <- ru(logf = dcauchy, log = TRUE, init = 0, r = 1.26, n = 1000)
##D 
##D # Half-Cauchy ===================
##D 
##D log_halfcauchy <- function(x) {
##D   return(ifelse(x < 0, -Inf, dcauchy(x, log = TRUE)))
##D }
##D 
##D # Like the Cauchy case the bounding box cannot be constructed if r < 1.
##D # We could use r > 1 but the mode is on the edge of the support of the
##D # density so as an alternative we use a log transformation.
##D 
##D x <- ru(logf = log_halfcauchy, init = 0, trans = "BC", lambda = 0, n = 1000)
##D x$pa
##D plot(x, ru_scale = TRUE)
##D 
##D # Example 4 from Wakefield et al. (1991) ===================
##D 
##D # Bivariate normal x bivariate student-t
##D log_norm_t <- function(x, mean = rep(0, d), sigma1 = diag(d), sigma2 = diag(d)) {
##D   x <- matrix(x, ncol = length(x))
##D   d <- ncol(x)
##D   log_h1 <- -0.5 * (x - mean) %*% solve(sigma1) %*% t(x - mean)
##D   log_h2 <- -2 * log(1 + 0.5 * x %*% solve(sigma2) %*% t(x))
##D   return(log_h1 + log_h2)
##D }
##D 
##D rho <- 0.9
##D covmat <- matrix(c(1, rho, rho, 1), 2, 2)
##D y <- c(0, 0)
##D 
##D # Case in the top right corner of Table 3
##D x <- ru(logf = log_norm_t, mean = y, sigma1 = covmat, sigma2 = covmat,
##D   d = 2, n = 10000, init = y, rotate = FALSE)
##D x$pa
##D 
##D # Rotation increases the probability of acceptance
##D x <- ru(logf = log_norm_t, mean = y, sigma1 = covmat, sigma2 = covmat,
##D   d = 2, n = 10000, init = y, rotate = TRUE)
##D x$pa
## End(Not run)



