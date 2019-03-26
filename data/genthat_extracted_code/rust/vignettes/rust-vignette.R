## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

required <- c("revdbayes")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)

## ---- echo=FALSE, results='asis'-----------------------------------------
d <- 1:6
pa <- (pi * exp(1)) ^ (d /2) / (2 ^ d * (1 + d / 2) ^ (1 + d /2))
pa <- matrix(pa, ncol = length(d), nrow = 1)
colnames(pa) <- d
knitr::kable(round(pa,3), caption = "$p_a(d, 1/2)$ as $d$ varies.")

## ------------------------------------------------------------------------
library(rust)
set.seed(46)
# Sample data from a GP(sigma, xi) distribution
gpd_data <- rgpd(m = 100, xi = -0.5, sigma = 1)
# Calculate summary statistics for use in the log-likelihood
ss <- gpd_sum_stats(gpd_data)
# Calculate an initial estimate
init <- c(mean(gpd_data), 0)

## ------------------------------------------------------------------------
n <- 10000
# Mode relocation only ----------------
x1 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
  lower = c(0, -Inf), rotate = FALSE)

# Rotation of axes plus mode relocation ----------------
x2 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
  lower = c(0, -Inf))

## ------------------------------------------------------------------------
# Find initial estimates for phi = (phi1, phi2),
# where phi1 = sigma
#   and phi2 = xi + sigma / max(x),
# and ranges of phi1 and phi2 over over which to evaluate the posterior to find
# a suitable value of lambda.
#
# gpd_init returns estimates of phi and associated estimated standard 
# errors based on the data alone.  This gives a basis for setting 
# min_phi and max_phi provided that the prior the prior is not
# strongly informative.
temp <- do.call(gpd_init, ss)
min_phi <- pmax(0, temp$init_phi - 2 * temp$se_phi)
max_phi <- pmax(0, temp$init_phi + 2 * temp$se_phi)

# Set phi_to_theta() that ensures positivity of phi
# We use phi1 = sigma and phi2 = xi + sigma / max(data)
phi_to_theta <- function(phi) c(phi[1], phi[2] - phi[1] / ss$xm)
log_j <- function(x) 0

## ------------------------------------------------------------------------
lambda <- find_lambda(logf = gpd_logpost, ss = ss, d = 2, min_phi = min_phi,
  max_phi = max_phi, phi_to_theta = phi_to_theta, log_j = log_j)
lambda

## ------------------------------------------------------------------------
# Sample on Box-Cox transformed, without rotation
x3 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
  lambda = lambda, rotate = FALSE)

# Box-Cox transformation, mode relocation and rotation ----------------
x4 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
  lambda = lambda, var_names = c("sigma", "xi"))

## ---- fig.show='hold'----------------------------------------------------
plot(x1, ru_scale = TRUE, cex.main = 0.75, cex.lab = 0.75, 
  main = paste("mode relocation \n pa = ", round(x1$pa, 3)))
plot(x2, ru_scale = TRUE, cex.main = 0.75, cex.lab = 0.75, 
  main = paste("mode relocation and rotation \n pa = ", round(x2$pa, 3)))
plot(x3, ru_scale = TRUE, cex.main = 0.75, cex.lab = 0.75, 
  main = paste("Box-Cox and mode relocation \n pa = ", round(x3$pa, 3)))
plot(x4, ru_scale = TRUE, cex.main = 0.75, cex.lab = 0.75,
  main = paste("Box-Cox, mode relocation and rotation \n pa = ", round(x4$pa, 3)))

## ---- fig.align='center'-------------------------------------------------
plot(x4, xlab = "sigma", ylab = "xi")

## ------------------------------------------------------------------------
summary(x4)

## ------------------------------------------------------------------------
# Sampling on original scale ----------------
x1 <- ru(logf = dlnorm, log = TRUE, d = 1, n = n, lower = 0, init = 1)
x1$pa
summary(x1)

# Box-Cox transform with lambda = 0 ----------------
lambda <- 0
x2 <- ru(logf = dlnorm, log = TRUE, d = 1, n = n, init = 0.1, trans = "BC",
         lambda = lambda)
x2$pa

## ------------------------------------------------------------------------
# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand
x3 <- ru(logf = dlnorm, log = TRUE, d = 1, n = n, init = 0.1, trans = "user",
        phi_to_theta = function(x) exp(x), log_j = function(x) -log(x))
x3$pa

## ---- fig.show='hold'----------------------------------------------------
plot(x3, ru_scale = TRUE, xlab = "z")
plot(x1, xlab = "x")

## ------------------------------------------------------------------------
# Note: the default value of max_phi = 10 is OK here but this will not always be the case.
lambda <- find_lambda_one_d(logf = dlnorm, log = TRUE)
lambda

## ------------------------------------------------------------------------
x4 <- ru(logf = dlnorm, log = TRUE, d = 1, n = n, trans = "BC", lambda = lambda)
x4$pa

## ------------------------------------------------------------------------
alpha <- 1
x1 <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n, lower = 0,
       init = alpha)
x1$pa

## ------------------------------------------------------------------------
# Box-Cox transform with lambda = 1/3 works well for shape >= 1. -----------
x2 <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n, trans = "BC",
       lambda = 1/3, init = alpha)
x2$pa

## ------------------------------------------------------------------------
# Equivalently, we could use trans = "user" and supply the (inverse) Box-Cox
# transformation and the log-Jacobian by hand
# Note: when phi_to_theta is undefined at x this function returns NA
phi_to_theta  <- function(x, lambda) {
  ifelse(x * lambda + 1 > 0, (x * lambda + 1) ^ (1 / lambda), NA)
}
log_j <- function(x, lambda) (lambda - 1) * log(x)
lambda <- 1/3
x3 <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n, trans = "user",
       phi_to_theta = phi_to_theta, log_j = log_j, user_args = list(lambda = lambda),
       init = alpha)
x3$pa

## ------------------------------------------------------------------------
alpha <- 0.1
# Choose a sensible value of max_phi
max_phi <- qgamma(0.999, shape = alpha)
# [I appreciate that typically the quantile function won't be available.
# In practice the value of lambda chosen is quite insensitive to the choice
# of max_phi, provided that max_phi is not far too large or far too small.]
max_phi <- qgamma(0.999, shape = alpha)
lambda <- find_lambda_one_d(logf = dgamma, shape = alpha, log = TRUE,
  max_phi = max_phi)
lambda
x4 <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = n, trans = "BC",
  lambda = lambda)
x4$pa

## ---- fig.show='hold'----------------------------------------------------
plot(x4)
plot(x4, ru_scale = TRUE)

## ------------------------------------------------------------------------
# two-dimensional normal with positive association ----------------
rho <- 0.9
covmat <- matrix(c(1, rho, rho, 1), 2, 2)
log_dmvnorm <- function(x, mean = rep(0, d), sigma = diag(d)) {
  x <- matrix(x, ncol = length(x))
  d <- ncol(x)
  - 0.5 * (x - mean) %*% solve(sigma) %*% t(x - mean)
}
# No rotation.
x1 <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = n, init = c(0, 0),
  rotate = FALSE)
# With rotation.
x2 <- ru(logf = log_dmvnorm, sigma = covmat, d = 2, n = n, init = c(0, 0))
c(x1$pa, x2$pa)

## ---- fig.show='hold'----------------------------------------------------
plot(x1, ru_scale = TRUE)
plot(x2, ru_scale = TRUE)

## ------------------------------------------------------------------------
# three-dimensional normal with positive association ----------------
covmat <- matrix(rho, 3, 3) + diag(1 - rho, 3)
# No rotation.  Slow !
x3 <- ru(logf = log_dmvnorm, sigma = covmat, d = 3, n = n,
  init = c(0, 0, 0), rotate = FALSE)
# With rotation.
x4 <- ru(logf = log_dmvnorm, sigma = covmat, d = 3, n = n,
  init = c(0, 0, 0))
c(x3$pa, x4$pa)

## ---- fig.width = 7------------------------------------------------------
plot(x3, ru_scale = TRUE)
plot(x4, ru_scale = TRUE)

