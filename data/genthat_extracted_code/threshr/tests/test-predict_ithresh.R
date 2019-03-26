context("predict.ithresh function")

# We check predict.ithresh, for different choices of the argument type.

# Set a tolerance for the comparison of the simulated values
my_tol <- 1e-5

# 1. Check that calling with type = "q" (quantiles) with the default
#    probabilities p = c(0.025, 0.25, 0.5, 0.75, 0.975) and then calling
#    with the results and with type = "p" gets us back to the initial
#    probabilities.

u_vec_gom <- quantile(gom, probs = seq(0, 0.9, by = 0.1))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom)

# (Default: which_u = "best")
qs <- predict(gom_cv, type = "q", n_years = c(100, 1000))$y
ps <- predict(gom_cv, type = "p", x = qs, n_years = c(100, 1000))$y
check_ps <- matrix(c(0.025, 0.25, 0.5, 0.75, 0.975), 5, 2)

test_that("predict.ithresh: type = p and typ2 = q agree", {
  testthat::expect_equal(ps, check_ps, tolerance = my_tol)
})

# 2. Check that the threshold-averaged distribution function lies in the
#    envelope of the individual thresholds.

# (Default: which_u = "all")
ps <- predict(gom_cv, type = "p", which_u = "all")$y
ave_ps <- ps[, 1]
check_upper <- apply(ps[, -1], 1, max)
check_lower <- apply(ps[, -1], 1, min)

for (j in 1:length(check_upper)) {
  test_that(paste("predict.ithresh: average less than max", j), {
    testthat::expect_lt(ave_ps[j], check_upper[j])
  })
}
for (j in 1:length(check_lower)) {
  test_that(paste("predict.ithresh: average greater than min", j), {
    testthat::expect_gt(ave_ps[j], check_lower[j])
  })
}

