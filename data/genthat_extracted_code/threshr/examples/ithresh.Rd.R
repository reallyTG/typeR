library(threshr)


### Name: ithresh
### Title: Threshold selection in the i.i.d. case (peaks over threshold)
### Aliases: ithresh

### ** Examples

# Note:
# 1. Smoother plots result from making n larger than the default n = 1000.
# 2. In the examples below validation thresholds rather higher than is
#    advisable have been used, with far fewer excesses than the minimum of
#    50 suggested by Jonathan and Ewans (2013).

## North Sea significant wave heights, default prior -----------------------
#' # A plot akin to the top left of Figure 7 in Northrop et al. (2017)
#' # ... but with fewer training thresholds

u_vec_ns <- quantile(ns, probs = seq(0.05, 0.95, by = 0.1))
ns_cv <- ithresh(data = ns, u_vec = u_vec_ns, n_v = 3)
plot(ns_cv, lwd = 2, add_legend = TRUE, legend_pos = "topright")
mtext("significant wave height / m", side = 3, line = 2.5)

## Gulf of Mexico significant wave heights, default prior ------------------

u_vec_gom <- quantile(gom, probs = seq(0.25, 0.95, by = 0.1))
# Setting a prior using its name and parameter value(s) --------------------
# This example gives the same prior as the default
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4, prior = "mdi",
                  h_prior = list(a = 0.6))

## Setting a user-defined (log-)prior R function ---------------------------
# This example also gives the same prior as the default
# (It will take longer to run than the example above because ithresh detects
#  that the prior is an R function and sets use_rcpp to FALSE.)
## No test: 
user_prior <- function(pars, a, min_xi = -1) {
  if (pars[1] <= 0 | pars[2] < min_xi) {
    return(-Inf)
  }
  return(-log(pars[1]) - a * pars[2])
}
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4, prior = user_prior,
                  h_prior = list(a = 0.6))
## End(No test)
## Setting a user-defined (log-)prior (pointer to a) C++ function ----------
# We make use of a C++ function and function create_prior_xptr() to create
# the required pointer from the revdbayes package

prior_ptr <- revdbayes:::create_prior_xptr("gp_flat")
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4, prior = prior_ptr,
                  h_prior = list(min_xi = -1))



