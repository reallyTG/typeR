context("GP functions")

# We check the functions pgp, qgp and rgp.

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

# 1. Check that calling qgp with probabilities p and then calling pgp with
#    the results gets us back to the initial probabilities.

pqgp_test_fn <- function(x, p) {
  loc <- x[1]
  scale <- x[2]
  shape <- x[3]
  qs <- qgp(p = p, loc = loc, scale = scale, shape = shape)
  ps <- pgp(qs, loc = loc, scale = scale, shape = shape)
  return(list(p = p, ps = ps))
}

test_function <- function(x, test_string) {
  testthat::test_that(test_string, {
    testthat::expect_equal(x$p, x$ps, tolerance = my_tol)
  })
}

ep <- 1e-10
loc_check <- 0
scale_check <- 2
shape_check <- c(-1, -0.5, -0.1, -ep, 0, ep, 0.1, 0.5, 1)
par_vals <- cbind(loc_check, scale_check, shape_check)
p_vals <- c(0.01, 0.1, 0.5, 0.9, 0.99)
for (i in 1:nrow(par_vals)) {
  test_string <- paste("GP shape = ", par_vals[i, ])
  x <- pqgp_test_fn(x = par_vals[i, ], p = p_vals)
  test_function(x, test_string)
}

# 2. Check that calling rgp and then pgp with the results gets us back to
#    the random U(0,1) variates simulated by stats::runif.

seed <- 28082017

rqgp_test_fn <- function(x) {
  loc <- x[, 1]
  scale <- x[, 2]
  shape <- x[, 3]
  n <- length(loc)
  set.seed(seed)
  qs <- rgp(n = n, loc = loc, scale = scale, shape = shape)
  set.seed(seed)
  us <- stats::runif(length(loc))
  ps <- pgp(qs, loc = loc, scale = scale, shape = shape)
  return(list(us = us, ps = ps))
}

test_function <- function(x, test_string) {
  testthat::test_that(test_string, {
    testthat::expect_equal(x$us, x$ps, tolerance = my_tol)
  })
}

ep <- 1e-10
loc_check <- 0
scale_check <- 2
shape_check <- c(-1, -0.5, -0.1, -ep, 0, ep, 0.1, 0.5, 1)
par_vals <- cbind(loc_check, scale_check, shape_check)
test_string <- "rgp and pgp"
x <- rqgp_test_fn(x = par_vals)
test_function(x, test_string)
