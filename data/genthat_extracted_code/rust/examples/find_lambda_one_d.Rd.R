library(rust)


### Name: find_lambda_one_d
### Title: Selecting Box-Cox parameter lambda in the one-dimensional case
### Aliases: find_lambda_one_d

### ** Examples

# Log-normal density ===================

# Note: the default value of max_phi = 10 is OK here but this will not
# always be the case.

lambda <- find_lambda_one_d(logf = dlnorm, log = TRUE)
lambda
x <- ru(logf = dlnorm, log = TRUE, d = 1, n = 1000, trans = "BC",
        lambda = lambda)

# Gamma density ===================

alpha <- 1
# Choose a sensible value of max_phi
max_phi <- qgamma(0.999, shape = alpha)
# [I appreciate that typically the quantile function won't be available.
# In practice the value of lambda chosen is quite insensitive to the choice
# of max_phi, provided that max_phi is not far too large or far too small.]

lambda <- find_lambda_one_d(logf = dgamma, shape = alpha, log = TRUE,
                            max_phi = max_phi)
lambda
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        trans = "BC", lambda = lambda)

alpha <- 0.1
# NB. for alpha < 1 the gamma(alpha, beta) density is not bounded
# So the ratio-of-uniforms emthod can't be used but it may work after a
# Box-Cox transformation.
# find_lambda_one_d() works much better than find_lambda() here.

max_phi <- qgamma(0.999, shape = alpha)
lambda <- find_lambda_one_d(logf = dgamma, shape = alpha, log = TRUE,
                            max_phi = max_phi)
lambda
x <- ru(logf = dgamma, shape = alpha, log = TRUE, d = 1, n = 1000,
        trans = "BC", lambda = lambda)

## Not run: 
##D plot(x)
##D plot(x, ru_scale = TRUE)
## End(Not run)



