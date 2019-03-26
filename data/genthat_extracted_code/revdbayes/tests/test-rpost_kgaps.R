context("K-gaps posterior: R vs Rcpp")

# We check that the values simulated using kgaps_post are (close enough to)
# identical when they are called using use_rcpp = TRUE and use_rcpp = FALSE
# using the same prior and starting from the same random number seed.

kgaps_test <- function(seed = 47, data = newlyn, thresh, k = 1, n = 5,
                       inc_cens = TRUE, alpha = 1, beta = 1, param = "logit"){
  set.seed(seed)
  res1 <- kgaps_post(data = data, thresh = thresh, k = k, n = n,
                     inc_cens = inc_cens, alpha = alpha, beta = beta,
                     param = param, use_rcpp = TRUE)
  set.seed(seed)
  res2 <- kgaps_post(data = data, thresh = thresh, k = k, n = n,
                     inc_cens = inc_cens, alpha = alpha, beta = beta,
                     param = param, use_rcpp = FALSE)
  return(list(sim1 = as.numeric(res1$sim_vals),
              sim2 = as.numeric(res2$sim_vals)))
}

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

test_function <- function(x, test_string) {
  testthat::test_that(test_string, {
    testthat::expect_equal(x$sim1, x$sim2, tolerance = my_tol)
  })
}

# Set a threshold
thresh <- quantile(newlyn, probs = 0.90)

x <- kgaps_test(data = newlyn, thresh = thresh)
test_function(x, "inc_cens = TRUE, param = logit")

x <- kgaps_test(data = newlyn, thresh = thresh, inc_cens = FALSE)
test_function(x, "inc_cens = FALSE, param = logit")

x <- kgaps_test(data = newlyn, thresh = thresh, param = "theta")
test_function(x, "inc_cens = TRUE, param = theta")

x <- kgaps_test(data = newlyn, thresh = thresh, inc_cens = FALSE,
                param = "theta")
test_function(x, "inc_cens = FALSE, param = theta")
