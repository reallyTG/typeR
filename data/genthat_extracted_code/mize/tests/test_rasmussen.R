context("Rasmussen Line Search")

rls <- function(fg, x, pv = -fg$gr(x)/abs(fg$gr(x)), alpha, c1, c2,
                xtol = 1e-6, eps = 1e-6, approx_armijo = FALSE,
                strong_curvature = TRUE,
                verbose = FALSE) {

  if (approx_armijo) {
    armijo_check_fn <- make_approx_armijo_ok_step(eps)
  }
  else {
    armijo_check_fn <- armijo_ok_step
  }

  wolfe_ok_step_fn <- make_wolfe_ok_step_fn(strong_curvature = strong_curvature,
                                            approx_armijo = approx_armijo,
                                            eps = eps)

  step0 <- make_step0(fg, x, pv)
  res <- ras_ls(phi = make_phi_alpha(x, fg, pv, calc_gradient_default = TRUE),
         alpha,
         step0 = step0,
         max_fn = 10000, xtol = xtol, c1 = c1, c2 = c2,
         armijo_check_fn = armijo_check_fn,
         wolfe_ok_step_fn = wolfe_ok_step_fn, verbose = verbose)
  res$step$par <- x + res$step$alpha * pv
  res$step0 <- step0
  res
}

## Test data from the More'-Thuente paper.

# Table 1
test_that("Table 1", {
  res11 <- rls(fg = f1, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.1)
  expect_step(res11, x = 1.2132, f = -0.34944, df = -0.043803, nfev = 9)
  res12 <- rls(fg = f1, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.1)
  expect_step(res12, x = 1.2531, f = -0.35098, df = -0.033723, nfev = 5)
  res13 <- rls(fg = f1, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.1)
  expect_step(res13, x = 10, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- rls(fg = f1, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.1)
  expect_step(res14, x = 37.054, f = -0.026948, df = 7.2516e-004, nfev = 4)
})

# Table 2
test_that("Table 2", {
  res21 <- rls(fg = f2, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res21, x = 1.5960, f = -2.6214, df = 0, nfev = 55)
  res22 <- rls(fg = f2, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res22, x = 1.5960, f = -2.6214, df = -4.2819e-010, nfev = 38)
  res23 <- rls(fg = f2, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res23, x = 1.5960, f = -2.6214, df = -1.2233e-010, nfev = 10)
  res24 <- rls(fg = f2, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res24, x = 1.5960, f = -2.6214, df = -1.2233e-010, nfev = 12)
})

# Table 3
test_that("Table 3", {
  res31 <- rls(fg = f3, x = 0, alpha = 1e-3, c1 = 0.1, c2 = 0.1)
  expect_step(res31, x = 1.0, f = -0.011160, df = 2.3645e-006, nfev = 18)
  res32 <- rls(fg = f3, x = 0, alpha = 1e-1, c1 = 0.1, c2 = 0.1)
  expect_step(res32, x = 1.0, f = -0.011160, df = -3.8131e-006, nfev = 15)
  res33 <- rls(fg = f3, x = 0, alpha = 1e1, c1 = 0.1, c2 = 0.1)
  expect_step(res33, x = 1.0, f = -0.011160, df = -4.1227e-015, nfev = 2)
  res34 <- rls(fg = f3, x = 0, alpha = 1e3, c1 = 0.1, c2 = 0.1)
  expect_step(res34, x = 1.0, f = -0.011160, df = -4.1227e-005, nfev = 4)
})

# Table 4
test_that("Table 4", {
  res41 <- rls(fg = f4, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res41, x = 0.023344, f = 0.99902, df = -9.1485e-004, nfev = 13)
  res42 <- rls(fg = f4, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res42, x = 0.1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- rls(fg = f4, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res43, x = 0.47507, f = 0.999002, df = -4.0043e-007, nfev = 3)
  res44 <- rls(fg = f4, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res44, x = 0.9235, f = 0.99901, df = 8.4666e-005, nfev = 5)
})

# Table 5
test_that("Table 5", {
  res51 <- rls(fg = f5, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res51, x = 0.074201, f = 0.99138, df = 5.3016e-007, nfev = 8)
  res52 <- rls(fg = f5, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res52, x = 0.07175, f = 0.99139, df = -6.1309e-004, nfev = 3)
  res53 <- rls(fg = f5, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res53, x = 0.074060, f = 0.99138, df = -3.3023e-005, nfev = 7)
  res54 <- rls(fg = f5, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res54, x = 0.073447, f = 0.99138, df = -1.8157e-004, nfev = 9)
})

# Table 6
test_that("Table 6", {
  res61 <- rls(fg = f6, x = 0, alpha = 1e-3, c1 = 0.001, c2 = 0.001)
  expect_step(res61, x = 0.9296, f = 0.99139, df = 9.7500e-004, nfev = 56)
  res62 <- rls(fg = f6, x = 0, alpha = 1e-1, c1 = 0.001, c2 = 0.001)
  expect_step(res62, x = 0.92662, f = 0.99138, df = 1.9698e-004, nfev = 30)
  res63 <- rls(fg = f6, x = 0, alpha = 1e1, c1 = 0.001, c2 = 0.001)
  expect_step(res63, x = 0.92966, f = 0.99139, df = 9.9413e-004, nfev = 7)
  res64 <- rls(fg = f6, x = 0, alpha = 1e3, c1 = 0.001, c2 = 0.001)
  expect_step(res64, x = 0.92436, f = 0.99139, df = -3.3353e-004, nfev = 8)
})

test_that("Function modification", {
  res4m <- rls(fg = f4, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res4m, x = 0.99278, f = 0.99907, df = 0.009454, alpha = 0.0072168, nfev = 6)
  res5m <- rls(fg = f5, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res5m, x = 0.99243, f = 0.99905, df = 0.017425, alpha = 0.0075707, nfev = 6)
  res6m <- rls(fg = f6, x = 1, alpha = 1, c1 = 0.1, c2 = 0.9)
  expect_step(res6m, x = 0.936501, f = 0.99140, df = 0.0032111, alpha = 0.063499, nfev = 4)
})
