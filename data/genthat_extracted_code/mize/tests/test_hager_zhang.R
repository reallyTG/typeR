context("Hager-Zhang Line Search")

# Results for the step size and number of function evaluations were generated
# by comparing with the output of the implementation of HZ line search in
# Julia 0.5: https://github.com/JuliaNLSolvers/LineSearches.jl, with the
# following modifications:
# # Change the standard curvature condition to the strong curvature condition
# # Allow termination after bracket phase and bisection step size generation
# # Remove the "flat" secant termination check

hzls <- function(fg, x, alpha, c1, c2, pv = -fg$gr(x)/abs(fg$gr(x)),
                 max_fn = Inf,
                 strong_curvature = TRUE,
                 always_check_convergence = TRUE,
                 approx_armijo = TRUE,
                 verbose = FALSE) {
  step0 <- make_step0(fg, x, pv)

  res <- line_search_hz(alpha = alpha,
                        step0 = step0,
                        phi = make_phi_alpha(x, fg, pv, calc_gradient_default = TRUE),
                        c1 = c1, c2 = c2, max_fn = max_fn,
                        strong_curvature = strong_curvature,
                        always_check_convergence = always_check_convergence,
                        approx_armijo = approx_armijo,
                        verbose = verbose)

  res$step$par <- x + res$step$alpha * pv
  res$step0 <- step0
  res
}

## Test data from the More'-Thuente paper.

# Table 1
test_that("Table 1", {
  res11 <- hzls(fg = f1, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.1)
  expect_step(res11, x = 1.6674, f = -0.3488, df = 0.0341, nfev = 8)
  res12 <- hzls(fg = f1, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.1)
  expect_step(res12, x = 1.347, f = -0.3531, df = -0.0128, nfev = 5)
  res13 <- hzls(fg = f1, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.1)
  expect_step(res13, x = 10, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- hzls(fg = f1, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.1)
  expect_step(res14, x = 1000, f = -0.001, df = 1e-6, nfev = 1)
})

# Table 2
test_that("Table 2", {
  res21 <- hzls(fg = f2, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res21, x = 1.5960, f = -2.6214, df = 4.544e-10, nfev = 18)
  res22 <- hzls(fg = f2, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res22, x = 1.5960, f = -2.6214, df = 5.0324e-8, nfev = 11)
  res23 <- hzls(fg = f2, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res23, x = 1.5960, f = -2.6214, df = 2.4178e-8, nfev = 18)
  res24 <- hzls(fg = f2, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res24, x = 1.5960, f = -2.6214, df = -7.7762e-9, nfev = 28)

  res24_maxfn <- hzls(fg = f2, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1,
                      max_fn = 20)
  expect_step(res24_maxfn, x = 1.9531, f = -0.6290, df = 13.3859, nfev = 20)
})

# Table 3
test_that("Table 3", {
  res31 <- hzls(fg = f3, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res31, x = 1.0, f = -0.011160, df = 9.6246e-6, nfev = 18)
  res32 <- hzls(fg = f3, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res32, x = 1.0, f = -0.011160, df = 7.9295e-11, nfev = 5)
  res33 <- hzls(fg = f3, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res33, x = 1.0, f = -0.011160, df = 1.4194e-5, nfev = 16)
  res34 <- hzls(fg = f3, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res34, x = 1.0, f = -0.011160, df = 1.4194e-5, nfev = 16)
})

# Table 4
test_that("Table 4", {
  res41 <- hzls(fg = f4, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res41, x = 0.625, f = 0.99900, df = 2.2733e-6, nfev = 5)
  res42 <- hzls(fg = f4, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res42, x = 0.1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- hzls(fg = f4, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res43, x = 0.37038, f = 0.99900, df = -2.3812e-6, nfev = 4)
  res44 <- hzls(fg = f4, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res44, x = 0.45725, f = 0.99900, df = -6.9346e-7, nfev = 8)
})

test_that("Table 5", {
  res51 <- hzls(fg = f5, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res51, x = 0.070774, f = 0.99139, df = -8.7407e-4, nfev = 6)
  res52 <- hzls(fg = f5, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res52, x = 0.074780, f = 0.99138, df = 1.3656e-4, nfev = 6)
  res53 <- hzls(fg = f5, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res53, x = 0.075689, f = 0.99139, df = 3.4459e-4, nfev = 12)
  res54 <- hzls(fg = f5, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res54, x = 0.072346, f = 0.99139, df = -4.5779e-4, nfev = 19)
})

test_that("Table 6", {
  res61 <- hzls(fg = f6, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res61, x = 0.92494, f = 0.99138, df = -2.0254e-4, nfev = 20)
  res62 <- hzls(fg = f6, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res62, x = 0.92420, f = 0.99139, df = -3.7009e-4, nfev = 18)
  res63 <- hzls(fg = f6, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res63, x = 0.92888, f = 0.99139, df = 7.8102e-4, nfev = 11)
  res64 <- hzls(fg = f6, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res64, x = 0.92353, f = 0.99139, df = -5.1728e-4, nfev = 13)
})

test_that("MT Function modification", {
  res4m <- hzls(fg = f4, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res4m, x = 0.5, f = 0.999, df = 0, alpha = 0.5, nfev = 2)
  res5m <- hzls(fg = f5, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res5m, x = 0.49776, f = 0.99461, df = 0.0087509, alpha = 0.50224,
              nfev = 2)
  res6m <- hzls(fg = f6, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res6m, x = 0.50224, f = 0.99461, df = -0.0087509, alpha = 0.49776,
              nfev = 2)
})

