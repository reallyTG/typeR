library(rust)


### Name: find_lambda
### Title: Selecting Box-Cox parameter lambda for general d.
### Aliases: find_lambda

### ** Examples

# Log-normal density ===================
# Note: the default value max_phi = 10 is OK here but this will not always
# be the case
lambda <- find_lambda(logf = dlnorm, log = TRUE)
lambda
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, trans = "BC",
        lambda = lambda)

# Gamma density ===================
alpha <- 1
#  Choose a sensible value of max_phi
max_phi <- qgamma(0.999, shape = alpha)
# [Of course, typically the quantile function won't be available.  However,
# In practice the value of lambda chosen is quite insensitive to the choice
# of max_phi, provided that max_phi is not far too large or far too small.]

lambda <- find_lambda(logf = dgamma, shape = alpha, log = TRUE,
                      max_phi = max_phi)
lambda
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        trans = "BC", lambda = lambda)

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
##D # Sample on original scale, with no rotation ----------------
##D x1 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
##D   lower = c(0, -Inf), rotate = FALSE)
##D plot(x1, xlab = "sigma", ylab = "xi")
##D # Parameter constraint line xi > -sigma/max(data)
##D # [This may not appear if the sample is far from the constraint.]
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x1)
##D 
##D # Sample on original scale, with rotation ----------------
##D x2 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, init = init,
##D   lower = c(0, -Inf))
##D plot(x2, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x2)
##D 
##D # Sample on Box-Cox transformed scale ----------------
##D 
##D # Find initial estimates for phi = (phi1, phi2),
##D # where phi1 = sigma
##D #   and phi2 = xi + sigma / max(x),
##D # and ranges of phi1 and phi2 over over which to evaluate
##D # the posterior to find a suitable value of lambda.
##D temp <- do.call(gpd_init, ss)
##D min_phi <- pmax(0, temp$init_phi - 2 * temp$se_phi)
##D max_phi <- pmax(0, temp$init_phi + 2 * temp$se_phi)
##D 
##D # Set phi_to_theta() that ensures positivity of phi
##D # We use phi1 = sigma and phi2 = xi + sigma / max(data)
##D phi_to_theta <- function(phi) c(phi[1], phi[2] - phi[1] / ss$xm)
##D log_j <- function(x) 0
##D 
##D lambda <- find_lambda(logf = gpd_logpost, ss = ss, d = 2, min_phi = min_phi,
##D   max_phi = max_phi, phi_to_theta = phi_to_theta, log_j = log_j)
##D lambda
##D 
##D # Sample on Box-Cox transformed, without rotation
##D x3 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
##D   lambda = lambda, rotate = FALSE)
##D plot(x3, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x3)
##D 
##D # Sample on Box-Cox transformed, with rotation
##D x4 <- ru(logf = gpd_logpost, ss = ss, d = 2, n = n, trans = "BC",
##D   lambda = lambda)
##D plot(x4, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x4)
##D 
##D def_par <- graphics::par(no.readonly = TRUE)
##D par(mfrow = c(2,2), mar = c(4, 4, 1.5, 1))
##D plot(x1, xlab = "sigma", ylab = "xi", ru_scale = TRUE,
##D   main = "mode relocation")
##D plot(x2, xlab = "sigma", ylab = "xi", ru_scale = TRUE,
##D   main = "mode relocation and rotation")
##D plot(x3, xlab = "sigma", ylab = "xi", ru_scale = TRUE,
##D   main = "Box-Cox and mode relocation")
##D plot(x4, xlab = "sigma", ylab = "xi", ru_scale = TRUE,
##D   main = "Box-Cox, mode relocation and rotation")
##D par(def_par)
## End(Not run)



