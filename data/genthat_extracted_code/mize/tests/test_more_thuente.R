context("More'-Thuente Line Search")

# This test uses input parameters, directions and step sizes from using the MT
# line search with a few steps of the CG solver. The expected values come
# from plugging the input values into Dianne O'Leary's Matlab code (running
# under GNU Octave).

mtls <- function(fg, x, pv = -fg$gr(x)/abs(fg$gr(x)), alpha, c1, c2,
                 eps = 1e-6, approx_armijo = FALSE, strong_curvature = TRUE,
                 safeguard_cubic = FALSE) {
  if (approx_armijo) {
    armijo_check_fn <- make_approx_armijo_ok_step(eps)
  }
  else {
    armijo_check_fn <- armijo_ok_step
  }

  wolfe_ok_step_fn <- make_wolfe_ok_step_fn(strong_curvature = strong_curvature,
                                            approx_armijo = approx_armijo,
                                            eps = eps)
  res <- cvsrch(phi = make_phi_alpha(x, fg, pv, calc_gradient_default = TRUE),
                alpha,
                step0 = make_step0(fg, x, pv), c1 = c1, c2 = c2,
                armijo_check_fn = armijo_check_fn,
                wolfe_ok_step_fn = wolfe_ok_step_fn,
                safeguard_cubic = safeguard_cubic)
  res$step$par <- x + res$step$alpha * pv
  res
}

## These tests are designed to reproduce the data in Tables 1-6
## of the More'-Thuente paper. They do so apart from a small number of minor
## differences (what value differs and when are indicated by comments before the
## test). Note that the values here are also reproduced by the Matlab code by
## O'Leary, i.e. where the R result differs from the published data in the
## original More'-Thuente paper, so does the Matlab code.

# Table 1
test_that("Table 1", {
  res11 <- mtls(fg = f1, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.1)
  expect_step(res11, x = 1.3650, f = -0.35333, df = -0.0091645, nfev = 6)
  res12 <- mtls(fg = f1, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.1)
  expect_step(res12, x = 1.4414, f = -0.35349, df = 0.0046645, nfev = 3)
  res13 <- mtls(fg = f1, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.1)
  expect_step(res13, x = 10, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mtls(fg = f1, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.1)
  expect_step(res14, x =  36.888, f = -0.027070, df = 7.3169e-004, nfev = 4)
})

# Table 2
test_that("Table 2", {
  # # gradient 7.1e-9
  res21 <- mtls(fg = f2, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res21, x = 1.5960, f = -2.6214, df = 3.8113e-009, nfev = 12)
  # gradient 10e-10 could be a typo in the paper and should be 1.0e-10?
  res22 <- mtls(fg = f2, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res22, x = 1.5960, f = -2.6214, df = 1.0106e-010, nfev = 8)
  res23 <- mtls(fg = f2, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res23, x = 1.5960, f = -2.6214, df = -4.9725e-009, nfev = 8)
  res24 <- mtls(fg = f2, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res24, x = 1.5960, f = -2.6214, df = -2.3091e-008, nfev = 11)
})

# Table 3
test_that("Table 3", {
  res31 <- mtls(fg = f3, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res31, x = 1.0, f = -0.011160, df = -5.1440e-005, nfev = 12)
  res32 <- mtls(fg = f3, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res32, x = 1.0, f = -0.011160, df = -1.9224e-004, nfev = 12)
  res33 <- mtls(fg = f3, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res33, x = 1.0, f = -0.011160, df = -1.9892e-006, nfev = 10)
  res34 <- mtls(fg = f3, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res34, x = 1.0, f = -0.011160, df = -1.5789e-005, nfev = 13)
})

# Table 4
test_that("Table 4", {
  # alpha = 0.08
  res41 <- mtls(fg = f4, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res41, x = 0.085, f = 0.99901, df = -6.8531e-005, nfev = 4)
  res42 <- mtls(fg = f4, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res42, x = 0.1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mtls(fg = f4, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res43, x = 0.34910, f = 0.999, df = -2.9195e-006, nfev = 3)
  res44 <- mtls(fg = f4, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res44, x = 0.8294, f = 0.999, df = 1.6436e-005, nfev = 4)
})

# Table 5
test_that("Table 5", {
  res51 <- mtls(fg = f5, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res51, x = 0.075011, f = 0.99138, df = 1.9025e-004, nfev = 6)
  res52 <- mtls(fg = f5, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res52, x = 0.07751, f = 0.99139, df = 7.3935e-004, nfev = 3)
  res53 <- mtls(fg = f5, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res53, x = 0.073142, f = 0.99138, df = -2.5691e-004, nfev = 7)
  res54 <- mtls(fg = f5, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res54, x = 0.076159, f = 0.99139, df = 4.4913e-004, nfev = 8)
})

# Table 6
test_that("Table 6", {
  res61 <- mtls(fg = f6, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res61, x = 0.9279, f = 0.99139, df = 5.2203e-004, nfev = 13)
  res62 <- mtls(fg = f6, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res62, x = 0.92615, f = 0.99138, df = 8.3588e-005, nfev = 11)
  res63 <- mtls(fg = f6, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res63, x = 0.92478, f = 0.99138, df = -2.3788e-004, nfev = 8)
  res64 <- mtls(fg = f6, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res64, x = 0.92440, f = 0.99139, df = -3.2498e-004, nfev = 11)
})

# Test line search modification in
# Xie, D., & Schlick, T. (2002).
# A more lenient stopping rule for line search algorithms.
# Optimization Methods and Software, 17(4), 683-700.
test_that("Safeguard Cubic",{
  # Only test examples that give different results
  res32c <- mtls(fg = f3, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1,
                 safeguard_cubic = TRUE)
  expect_step(res32c, x = 1.0, f = -0.011160, df = -1.5842e-10, nfev = 13)
  res64c <- mtls(fg = f6, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001,
                 safeguard_cubic = TRUE)
  expect_step(res64c, x = 0.92525, f = 0.99138, df = -1.2989e-4, nfev = 10)
})


# The above tests don't enter the code path where the function is modified much. The
# tests below do exercise that part.
test_that("Function modification", {
  res4m <- mtls(fg = f4, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res4m, x = 0.99615, f = 0.99913, df = 0.032049, alpha = 0.0038522, nfev = 6)
  res5m <- mtls(fg = f5, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res5m, x = 0.99599, f = 0.99914, df = 0.038284, alpha = 0.0040126, nfev = 6)
  res6m <- mtls(fg = f6, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res6m, x = 0.95655, f = 0.99157, df = 0.016504, alpha = 0.043447, nfev = 4)
})
