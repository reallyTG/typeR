library(revdbayes)


### Name: set_prior
### Title: Construction of prior distributions for extreme value model
###   parameters
### Aliases: set_prior

### ** Examples

# Normal prior for GEV parameters (mu, log(sigma), xi).
mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
pn

# Prior for GP parameters with flat prior for xi on (-1, infinity).
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
fp

# A user-defined prior (see the vignette for details).
u_prior_fn <- function(x, ab) {
  if (x[1] <= 0 | x[2] <= -1 | x[2] >= 1) {
    return(-Inf)
  }
  return(-log(x[1]) + (ab[1] - 1) * log(1 + x[2]) +
         (ab[2] - 1) * log(1 - x[2]))
}
up <- set_prior(prior = u_prior_fn, ab = c(2, 2))

# A user-defined prior using a pointer to a C++ function
ptr_gp_flat <- create_prior_xptr("gp_flat")
u_prior_ptr <- set_prior(prior = ptr_gp_flat, model = "gp")



