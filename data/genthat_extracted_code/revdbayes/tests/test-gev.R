context("GEV functions")

# We check the functions pgev, qgev and rgev.

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

# 1. Check that calling qgev with probabilities p and then calling pgev with
#    the results gets us back to the initial probabilities.

pqgev_test_fn <- function(x, p) {
  loc <- x[1]
  scale <- x[2]
  shape <- x[3]
  qs <- qgev(p = p, loc = loc, scale = scale, shape = shape)
  ps <- pgev(qs, loc = loc, scale = scale, shape = shape)
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
  test_string <- paste("gev shape = ", par_vals[i, ])
  x <- pqgev_test_fn(x = par_vals[i, ], p = p_vals)
  test_function(x, test_string)
}

# 2. Check that calling rgev and then pgev with the results gets us back to
#    the random U(0,1) variates simulated by stats::runif.

seed <- 28082017

rqgev_test_fn <- function(x) {
  loc <- x[, 1]
  scale <- x[, 2]
  shape <- x[, 3]
  n <- length(loc)
  set.seed(seed)
  qs <- rgev(n = n, loc = loc, scale = scale, shape = shape)
  set.seed(seed)
  us <- stats::runif(length(loc))
  ps <- pgev(qs, loc = loc, scale = scale, shape = shape)
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
test_string <- "rgev and pgev"
x <- rqgev_test_fn(x = par_vals)
test_function(x, test_string)
