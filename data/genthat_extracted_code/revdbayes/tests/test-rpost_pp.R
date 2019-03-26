context("PP: rpost_rcpp vs rpost")

# We check that the values simulated using rpost() and rpost_rcpp() are
# (close enough to) identical when they are called using the same data,
# the same prior and starting from the same random number seed.

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

# Set a threshold
rthresh <- 40

pp_test <- function(seed = 47, prior, n = 5, rotate = TRUE, trans = "none",
                     use_phi_map = FALSE, data = rainfall, nrep = 2, ...){
  if (prior == "user") {
    prior_rfn <- set_prior(prior = "flat", model = "gev", ...)
    ptr_gev_flat <- create_prior_xptr("gev_flat")
    prior_cfn <- set_prior(prior = ptr_gev_flat, model = "gev", min_xi = -1,
                           max_xi = Inf)
  } else {
    prior_rfn <- set_prior(prior = prior, model = "gev", ...)
    prior_cfn <- set_prior(prior = prior, model = "gev", ...)
  }
  set.seed(seed)
  res1 <- rpost(n = n, model = "pp", prior = prior_rfn, thresh = rthresh,
                noy = 54, data = data, rotate = rotate, trans = trans,
                use_phi_map = use_phi_map, nrep = nrep)
  set.seed(seed)
  res2 <- rpost_rcpp(n = n, model = "pp", prior = prior_cfn, thresh = rthresh,
                     noy = 54, data = data, rotate = rotate, trans = trans,
                     use_phi_map = use_phi_map, nrep = nrep)
  return(list(sim1 = as.numeric(res1$sim_vals),
              sim2 = as.numeric(res2$sim_vals),
              data_rep1 = as.numeric(res1$data_rep),
              data_rep2 = as.numeric(res2$data_rep)))
}

test_function <- function(x, test_string) {
  testthat::test_that(test_string, {
    testthat::expect_equal(x$sim1, x$sim2, tolerance = my_tol)
    testthat::expect_equal(x$data_rep1, x$data_rep2, tolerance = my_tol)
  })
}

# Slow, belt-and-braces
#rotate_vals <- c(FALSE, TRUE)
#trans_vals <- c("none", "BC")
#use_phi_map_vals <- c(FALSE, TRUE)

# Faster, sufficient
rotate_vals <- TRUE
trans_vals <- "BC"
use_phi_map_vals <- TRUE

# As model = "pp" is based on the same priors as model = "gev" we don't need
# to test all the possible in-built priors.  We just check that rpost() and
# rpost_rcpp() agree for one prior.

for (rotate in rotate_vals) {
  for (trans in trans_vals) {
    for (use_phi_map in use_phi_map_vals) {
      test_string <- paste("rotate =", rotate, "trans =", trans,
                            "use_phi_map =", use_phi_map)
      x <- pp_test(prior = "flat", min_xi = -1,
                   rotate = rotate, trans = trans, use_phi_map = use_phi_map)
      test_function(x, test_string)
      x <- pp_test(prior = "user",
                   rotate = rotate, trans = trans, use_phi_map = use_phi_map)
      test_function(x, test_string)
      x <- pp_test(prior = "quant", prob = 10^-(1:3), shape = c(38.9,7.1,47),
                   scale = c(1.5,6.3,2.6),
                   rotate = rotate, trans = trans, use_phi_map = use_phi_map)
      test_function(x, test_string)
    }
  }
}
