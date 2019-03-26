library(rust)


### Name: find_lambda_rcpp
### Title: Selecting Box-Cox parameter lambda for general d using C++ via
###   Rcpp.
### Aliases: find_lambda_rcpp

### ** Examples


# Log-normal density ===================
# Note: the default value max_phi = 10 is OK here but this will not always
# be the case
ptr_lnorm <- create_xptr("logdlnorm")
mu <- 0
sigma <- 1
lambda <- find_lambda_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma)
lambda
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, d = 1, n = 1000,
             trans = "BC", lambda = lambda)

# Gamma density ===================
alpha <- 1
#  Choose a sensible value of max_phi
max_phi <- qgamma(0.999, shape = alpha)
# [Of course, typically the quantile function won't be available.  However,
# In practice the value of lambda chosen is quite insensitive to the choice
# of max_phi, provided that max_phi is not far too large or far too small.]

ptr_gam <- create_xptr("logdgamma")
lambda <- find_lambda_rcpp(logf = ptr_gam, alpha = alpha, max_phi = max_phi)
lambda
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1000, trans = "BC",
             lambda = lambda)

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
##D # Sample on original scale, with no rotation ----------------
##D ptr_gp <- create_xptr("loggp")
##D for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
##D                      lower = c(0, -Inf)), ss, rotate = FALSE)
##D x1 <- do.call(ru_rcpp, for_ru_rcpp)
##D plot(x1, xlab = "sigma", ylab = "xi")
##D # Parameter constraint line xi > -sigma/max(data)
##D # [This may not appear if the sample is far from the constraint.]
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x1)
##D 
##D # Sample on original scale, with rotation ----------------
##D for_ru_rcpp <- c(list(logf = ptr_gp, init = init, d = 2, n = n,
##D                       lower = c(0, -Inf)), ss)
##D x2 <- do.call(ru_rcpp, for_ru_rcpp)
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
##D 
##D # Create an external pointer to this C++ function
##D ptr_phi_to_theta_gp <- create_phi_to_theta_xptr("gp")
##D # Note: log_j is set to zero by default inside find_lambda_rcpp()
##D lambda <- find_lambda_rcpp(logf = ptr_gp, ss = ss, d = 2, min_phi = min_phi,
##D                            max_phi = max_phi, user_args = list(xm = ss$xm),
##D                            phi_to_theta = ptr_phi_to_theta_gp)
##D lambda
##D 
##D # Sample on Box-Cox transformed, without rotation
##D x3 <- ru_rcpp(logf = ptr_gp, ss = ss, d = 2, n = n, trans = "BC",
##D               lambda = lambda, rotate = FALSE)
##D plot(x3, xlab = "sigma", ylab = "xi")
##D abline(a = 0, b = -1 / ss$xm)
##D summary(x3)
##D 
##D # Sample on Box-Cox transformed, with rotation
##D x4 <- ru_rcpp(logf = ptr_gp, ss = ss, d = 2, n = n, trans = "BC",
##D               lambda = lambda)
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



