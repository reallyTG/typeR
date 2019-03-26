context("ithresh")

# Set a tolerance for the comparison of the simulated values

my_tol <- 1e-5
seed <- 27082017

# 1. We check that the results from ithresh produced using use_rcpp = TRUE and
#    use_rcpp = FALSE are identical.

u_vec_gom <- quantile(gom, probs = c(0.05, 0.5, 0.9))
# use_rcpp = TRUE
set.seed(seed)
res1 <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 2)
# use_rcpp = TRUE
set.seed(seed)
res2 <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 2, use_rcpp = FALSE)

test_that("ithresh, pred_perf: rcpp, no rcppf", {
  testthat::expect_equal(res1$pred_perf, res2$pred_perf, tolerance = my_tol)
})
test_that("ithresh, sim_vals: rcpp, no rcppf", {
  testthat::expect_equal(res1$sim_vals, res2$sim_vals, tolerance = my_tol)
})


# 2. Repeat for trans = "BC".

# use_rcpp = TRUE
set.seed(seed)
res1 <- ithresh(data = gom, u_vec = u_vec_gom, trans = "BC", n_v = 2)
# use_rcpp = TRUE
set.seed(seed)
res2 <- ithresh(data = gom, u_vec = u_vec_gom, trans = "BC", n_v = 2,
                use_rcpp = FALSE)

test_that("ithresh, pred_perf: rcpp, no rcpp, trans = BC", {
  testthat::expect_equal(res1$pred_perf, res2$pred_perf, tolerance = my_tol)
})
test_that("ithresh, sim_vals: rcpp, no rcpp, trans = BC", {
  testthat::expect_equal(res1$sim_vals, res2$sim_vals, tolerance = my_tol)
})
