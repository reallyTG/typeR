library(rust)


### Name: find_lambda_one_d_rcpp
### Title: Selecting Box-Cox parameter lambda in the one-dimensional case
###   using C++ via Rcpp
### Aliases: find_lambda_one_d_rcpp

### ** Examples


# Log-normal density ===================

# Note: the default value of max_phi = 10 is OK here but this will not
# always be the case.

ptr_lnorm <- create_xptr("logdlnorm")
mu <- 0
sigma <- 1
lambda <- find_lambda_one_d_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma)
lambda
x <- ru_rcpp(logf = ptr_lnorm, mu = mu, sigma = sigma, log = TRUE, d = 1,
             n = 1000, trans = "BC", lambda = lambda)

# Gamma density ===================

alpha <- 1
# Choose a sensible value of max_phi
max_phi <- qgamma(0.999, shape = alpha)
# [I appreciate that typically the quantile function won't be available.
# In practice the value of lambda chosen is quite insensitive to the choice
# of max_phi, provided that max_phi is not far too large or far too small.]

ptr_gam <- create_xptr("logdgamma")
lambda <- find_lambda_one_d_rcpp(logf = ptr_gam, alpha = alpha,
                                 max_phi = max_phi)
lambda
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1000, trans = "BC",
             lambda = lambda)

alpha <- 0.1
# NB. for alpha < 1 the gamma(alpha, beta) density is not bounded
# So the ratio-of-uniforms emthod can't be used but it may work after a
# Box-Cox transformation.
# find_lambda_one_d() works much better than find_lambda() here.

max_phi <- qgamma(0.999, shape = alpha)
lambda <- find_lambda_one_d_rcpp(logf = ptr_gam, alpha = alpha,
                                 max_phi = max_phi)
lambda
x <- ru_rcpp(logf = ptr_gam, alpha = alpha, d = 1, n = 1000, trans = "BC",
             lambda = lambda)
## Not run: 
##D plot(x)
##D plot(x, ru_scale = TRUE)
## End(Not run)



