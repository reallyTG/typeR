context("predict.evpost function")

# We check predict.evpost for parameteizations binGP and GEV, for different
# choices of the argument type.

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

# 1. GEV
#
#    Check that calling with type = "q" (quantiles) with the default
#    probabilities p = c(0.025, 0.25, 0.5, 0.75, 0.975) and then calling
#    with the results and with type = "p" gets us back to the initial
#    probabilities.

mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
gevp  <- rpost_rcpp(n = 1000, model = "gev", prior = pn, data = portpirie)

qs <- predict(gevp, type = "q", n_years = c(100, 1000))$y
ps <- predict(gevp, type = "p", x = qs, n_years = c(100, 1000))$y

check_ps <- matrix(c(0.025, 0.25, 0.5, 0.75, 0.975), 5, 2)

testthat::test_that("GEV_predict",
                    testthat::expect_equal(ps, check_ps, tolerance = my_tol))

# 2. binGP
#
#    Check that calling with type = "q" (quantiles) with the default
#    probabilities p = c(0.025, 0.25, 0.5, 0.75, 0.975) and then calling
#    with the results and with type = "p" gets us back to the initial
#    probabilities.

u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
bp <- set_bin_prior(prior = "jeffreys")
# NB. Update when npy as an attribute is used.
npy_gom <- length(gom)/105
bgpg <- rpost_rcpp(n = 1000, model = "bingp", prior = fp, thresh = u,
                   data = gom, bin_prior = bp, npy = npy_gom)

qs <- predict(bgpg, type = "q", n_years = c(100, 1000))$y
ps <- predict(bgpg, type = "p", x = qs, n_years = c(100, 1000))$y

check_ps <- matrix(c(0.025, 0.25, 0.5, 0.75, 0.975), 5, 2)

testthat::test_that("binGP_predict",
                    testthat::expect_equal(ps, check_ps, tolerance = my_tol))

