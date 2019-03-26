context("stability")

# We check that the results from stability using prof = FALSE and prof = TRUE
# are identical.

# Set a tolerance for the comparison of the simulated values

my_tol <- 1e-5

n <- 500
seed <- 29082017

test_data <- revdbayes::rgp(n)
u_vec <- quantile(test_data, probs = seq(0.05, 0.95, by = 0.1))

res1 <- stability(data = test_data, u_vec = u_vec)
res2 <- stability(data = test_data, u_vec = u_vec, prof = TRUE)

test_that("MLEs equal regardless of prof", {
  testthat::expect_equal(res1$ests, res2$ests, tolerance = my_tol)
})
