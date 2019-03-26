context("Schmidt (MinFunc) Armijo Line Search")

# Test values produced by running the original minFunc ArmijoBacktrack function
# using Octave 4.2.0

# Test data from the More'-Thuente paper and intended to test a Strong Wolfe
# criterion.
# For backtracking, these tests mostly merely ensure the smaller step sizes
# will be accepted immediately, but the initial alpha = 1000 are slightly more
# interesting.

mfls <- function(fg, x, pv, alpha, c1, LS_interp = 2, LS_multi = 0, debug = FALSE) {
  step0 <- make_step0(fg, x, pv)

  res <- ArmijoBacktrack(alpha, f = step0$f, g = step0$df,
                         gtd = step0$d,
                         c1 = c1,
                         LS_interp = LS_interp, LS_multi = LS_multi,
                         funObj = make_phi_alpha(x, fg, pv, calc_gradient_default = TRUE),
                         varargin = NULL,
                         pnorm_inf = max(abs(pv)),
                         progTol = 1e-9, debug = debug)

  res$step$par <- x + res$step$alpha * pv
  res
}

# Table 1
test_that("Table 1 Grad/Cubic Interpolation", {
  pv1 <- -f1$gr(0)/abs(f1$gr(0))
  res11 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res11, x = 1e-3, f = -5e-4, df = -0.5, nfev = 1)
  res12 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res12, x = 1e-1, f = -0.049751, df = -0.49256, nfev = 1)
  res13 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res13, x = 1e1, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res14, x = 37.054, f = -0.026948, df = 7.2516e-004, nfev = 4)
})

# Table 2
test_that("Table 2 Grad/Cubic Interpolation", {
  pv2 <- -f2$gr(0)/abs(f2$gr(0))
  res21 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-3, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res21, x = 0.001, f = -1.2469e-9, df = -9.9688e-007, nfev = 1)
  res22 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-1, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res22, x = 0.1, f = -2.2181e-4, df = -0.008414, nfev = 1)
  res23 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e1, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res23, x = 1.3546, f = -2.1852, df = -3.0268, nfev = 4)
  res24 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e3, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res24, x = 1.8850, f = -1.4135, df = 9.7396, nfev = 9)
})

# Table 3
test_that("Table 3 Grad/Cubic Interpolation", {
  pv3 <- -f3$gr(0)/abs(f3$gr(0))
  res31 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-3, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res31, x = 1e-3, f = 0.99999, df =  -0.011857, nfev = 1)
  res32 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-1, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res32, x = 1e-1, f =  0.89747, df = -0.022189, nfev = 1)
  res33 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e1, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res33, x = 0.020790, f = 0.99466, df = -0.71010, nfev = 2)
  res34 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e3, c1 = 0.1, LS_interp = 2, LS_multi = 0)
  expect_step(res34, x = 0.015942, f = 0.99745, df = -0.44579, nfev = 3)
})

# Table 4
test_that("Table 4 Grad/Cubic Interpolation", {
  pv4 <- -f4$gr(0)/abs(f4$gr(0))
  res41 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res41, x = 1e-3, f = 0.99941, df = -0.29260, nfev = 1)
  res42 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res42, x = 1e-1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res43, x = 0.34963, f = 0.99900, df = -2.9053e-006, nfev = 3)
  res44 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res44, x = 0.8294, f = 0.99900, df = 1.6436e-005, nfev = 4)
})

# Table 5
test_that("Table 5 Grad/Cubic Interpolation", {
  pv5 <- -f5$gr(0)/abs(f5$gr(0))
  res51 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res51, x = 1e-3, f = 0.99910, df = -0.89065, nfev = 1)
  res52 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res52, x = 1e-1, f = 0.99144, df = 0.0039933, nfev = 1)
  res53 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res53, x = 0.33678, f = 0.99321, df = 0.0085115, nfev = 3)
  res54 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res54, x = 0.82237, f = 0.99747, df = 0.0088923, nfev = 4)
})

# Table 6
test_that("Table 6 Grad/Cubic Interpolation", {
  pv6 <- -f6$gr(0)/abs(f6$gr(0))
  res61 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res61, x = 1e-3, f = 0.99945, df = -0.29888, nfev = 1)
  res62 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res62, x = 1e-1, f = 0.99817, df = -0.0089383, nfev = 1)
  res63 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res63, x = 0.51544, f = 0.99449, df = -0.0087397, nfev = 3)
  res64 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 0)
  expect_step(res64, x = 0.83698, f = 0.99182, df = -0.0070770, nfev = 4)
})

# Use Quartic or Quintic interpolation of points are available

# Table 1
test_that("Table 1 Grad/Quartic/Quintic Interpolation", {
  pv1 <- -f1$gr(0)/abs(f1$gr(0))
  res11 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res11, x = 1e-3, f = -5e-4, df = -0.5, nfev = 1)
  res12 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res12, x = 1e-1, f = -0.049751, df = -0.49256, nfev = 1)
  res13 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res13, x = 1e1, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res14, x = 27.506, f = -0.036260, df = 0.0013113, nfev = 4)
})

# Table 2
test_that("Table 2 Grad/Quartic/Quintic Interpolation", {
  pv2 <- -f2$gr(0)/abs(f2$gr(0))
  res21 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-3, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res21, x = 0.001, f = -1.2469e-9, df = -9.9688e-007, nfev = 1)
  res22 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-1, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res22, x = 0.1, f = -2.2181e-4, df = -0.008414, nfev = 1)
  res23 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e1, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res23, x = 1.5960, f = -2.6214, df = 7.7853e-013, nfev = 3)
  res24 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e3, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res24, x = 1.5960, f = -2.6214, df = 2.7767e-006, nfev = 3)
})

# Table 3
test_that("Table 3 Grad/Quartic/Quintic Interpolation", {
  pv3 <- -f3$gr(0)/abs(f3$gr(0))
  res31 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-3, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res31, x = 1e-3, f = 0.99999, df =  -0.011857, nfev = 1)
  res32 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-1, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res32, x = 1e-1, f =  0.89747, df = -0.022189, nfev = 1)
  res33 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e1, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res33, x = 0.020790, f = 0.99466, df = -0.71010, nfev = 2)
  res34 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e3, c1 = 0.1, LS_interp = 2, LS_multi = 1)
  expect_step(res34, x = 0.015848, f = 0.99749, df = -0.44105, nfev = 3)
})

# Table 4
test_that("Table 4 Grad/Quartic/Quintic Interpolation", {
  pv4 <- -f4$gr(0)/abs(f4$gr(0))
  res41 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res41, x = 1e-3, f = 0.99941, df = -0.29260, nfev = 1)
  res42 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res42, x = 1e-1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res43, x = 0.33621, f = 0.99900, df = -3.2854e-006, nfev = 3)
  res44 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res44, x = 0.73037, f = 0.99900, df = 5.9340e-006, nfev = 4)
})

# Table 5
test_that("Table 5 Grad/Quartic/Quintic Interpolation", {
  pv5 <- -f5$gr(0)/abs(f5$gr(0))
  res51 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res51, x = 1e-3, f = 0.99910, df = -0.89065, nfev = 1)
  res52 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res52, x = 1e-1, f = 0.99144, df = 0.0039933, nfev = 1)
  res53 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res53, x = 0.3219, f = 0.99309, df = 0.0084699, nfev = 3)
  res54 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res54, x = 0.72452, f = 0.99661, df = 0.0088619, nfev = 4)
})

# Table 6
test_that("Table 6 Grad/Quartic/Quintic Interpolation", {
  pv6 <- -f6$gr(0)/abs(f6$gr(0))
  res61 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res61, x = 1e-3, f = 0.99945, df = -0.29888, nfev = 1)
  res62 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res62, x = 1e-1, f = 0.99817, df = -0.0089383, nfev = 1)
  res63 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e1, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res63, x = 0.51498, f = 0.99450, df = -0.0087401, nfev = 3)
  res64 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e3, c1 = 0.001, LS_interp = 2, LS_multi = 1)
  expect_step(res64, x = 0.73676, f = 0.99260, df = -0.0082314, nfev = 4)
})

# Quadratic interpolation: use two f values + current grad

# Table 1
test_that("Table 1 BT/Quad Interpolation", {
  pv1 <- -f1$gr(0)/abs(f1$gr(0))
  res11 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res11, x = 1e-3, f = -5e-4, df = -0.5, nfev = 1)
  res12 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res12, x = 1e-1, f = -0.049751, df = -0.49256, nfev = 1)
  res13 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res13, x = 1e1, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res14, x = 31.271, f = -0.031913, df = 0.0010164, nfev = 6)
})

# Table 2
test_that("Table 2 BT/Quad Interpolation", {
  pv2 <- -f2$gr(0)/abs(f2$gr(0))
  res21 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-3, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res21, x = 0.001, f = -1.2469e-9, df = -9.9688e-007, nfev = 1)
  res22 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-1, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res22, x = 0.1, f = -2.2181e-4, df = -0.008414, nfev = 1)
  res23 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e1, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res23, x = 0.01, f = -7.6294e-008, df = -2.1760e-005, nfev = 2)
  res24 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e3, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res24, x = 1, f =  -1.0120, df = -3.0159, nfev = 2)
})

# Table 3
test_that("Table 3 BT/Quad Interpolation", {
  pv3 <- -f3$gr(0)/abs(f3$gr(0))
  res31 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-3, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res31, x = 1e-3, f = 0.99999, df =  -0.011857, nfev = 1)
  res32 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-1, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res32, x = 1e-1, f =  0.89747, df = -0.022189, nfev = 1)
  res33 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e1, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res33, x = 0.061728, f = 0.92862, df = -1.7941, nfev = 2)
  res34 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e3, c1 = 0.1, LS_interp = 1, LS_multi = 0)
  expect_step(res34, x = 0.040707, f = 0.96905, df = -1.7894, nfev = 3)
})

# Table 4
test_that("Table 4 BT/Quad Interpolation", {
  pv4 <- -f4$gr(0)/abs(f4$gr(0))
  res41 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res41, x = 1e-3, f = 0.99941, df = -0.29260, nfev = 1)
  res42 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res42, x = 1e-1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res43, x = 0.47507, f = 0.99900, df = -4.0043e-007, nfev = 3)
  res44 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res44, x = 0.92346, f = 0.99901, df = 8.4666e-005, nfev = 5)
})

# Table 5
test_that("Table 5 BT/Quad Interpolation", {
  pv5 <- -f5$gr(0)/abs(f5$gr(0))
  res51 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res51, x = 1e-3, f = 0.99910, df = -0.89065, nfev = 1)
  res52 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res52, x = 1e-1, f = 0.99144, df = 0.0039933, nfev = 1)
  res53 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res53, x = 0.47352, f = 0.99439, df = 0.0087296, nfev = 3)
  res54 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res54, x = 0.91415, f = 0.99829, df = 0.0089579, nfev = 5)
})

# Table 6
test_that("Table 6 BT/Quad Interpolation", {
  pv6 <- -f6$gr(0)/abs(f6$gr(0))
  res61 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res61, x = 1e-3, f = 0.99945, df = -0.29888, nfev = 1)
  res62 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res62, x = 1e-1, f = 0.99817, df = -0.0089383, nfev = 1)
  res63 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res63, x = 0.47794, f = 0.99482, df = -0.0087694, nfev = 3)
  res64 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 0)
  expect_step(res64, x = 0.93351, f = 0.99139, df = 0.0021598, nfev = 5)
})

# Cubic interpolation (i.e. use three f values + current grad)

# Table 1
test_that("Table 1 BT/Cubic Interpolation", {
  pv1 <- -f1$gr(0)/abs(f1$gr(0))
  res11 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res11, x = 1e-3, f = -5e-4, df = -0.5, nfev = 1)
  res12 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res12, x = 1e-1, f = -0.049751, df = -0.49256, nfev = 1)
  res13 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res13, x = 1e1, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res14, x = 40.021, f = -0.024956, df = 6.2202e-004, nfev = 5)
})

# Table 2
test_that("Table 2 BT/Cubic Interpolation", {
  pv2 <- -f2$gr(0)/abs(f2$gr(0))
  res21 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-3, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res21, x = 0.001, f = -1.2469e-9, df = -9.9688e-007, nfev = 1)
  res22 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-1, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res22, x = 0.1, f = -2.2181e-4, df = -0.008414, nfev = 1)
  # Same results as Quadratic interpolation because we find an acceptable step before
  # reaching three points
  res23 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e1, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res23, x = 0.01, f = -7.6294e-008, df = -2.1760e-005, nfev = 2)
  res24 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e3, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res24, x = 1, f =  -1.0120, df = -3.0159, nfev = 2)
})

# Table 3
test_that("Table 3 BT/Cubic Interpolation", {
  pv3 <- -f3$gr(0)/abs(f3$gr(0))
  res31 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-3, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res31, x = 1e-3, f = 0.99999, df =  -0.011857, nfev = 1)
  res32 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-1, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res32, x = 1e-1, f =  0.89747, df = -0.022189, nfev = 1)
  res33 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e1, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res33, x = 0.061728, f = 0.92862, df = -1.7941, nfev = 2)
  res34 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e3, c1 = 0.1, LS_interp = 1, LS_multi = 1)
  expect_step(res34, x = 0.040509, f = 0.96940, df = -1.7821, nfev = 3)
})

# Table 4
test_that("Table 4 BT/Cubic Interpolation", {
  pv4 <- -f4$gr(0)/abs(f4$gr(0))
  res41 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res41, x = 1e-3, f = 0.99941, df = -0.29260, nfev = 1)
  res42 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res42, x = 1e-1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res43, x = 0.43119, f = 0.99900, df = -1.1428e-006, nfev = 3)
  res44 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res44, x = 0.69331, f = 0.99900, df = 4.2715e-006, nfev = 5)
})

# Table 5
test_that("Table 5 BT/Cubic Interpolation", {
  pv5 <- -f5$gr(0)/abs(f5$gr(0))
  res51 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res51, x = 1e-3, f = 0.99910, df = -0.89065, nfev = 1)
  res52 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res52, x = 1e-1, f = 0.99144, df = 0.0039933, nfev = 1)
  res53 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res53, x = 0.42991, f = 0.99401, df = 0.0086819, nfev = 3)
  res54 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res54, x = 0.68711, f = 0.99627, df = 0.0088498, nfev = 5)
})

# Table 6
test_that("Table 6 BT/Cubic Interpolation", {
  pv6 <- -f6$gr(0)/abs(f6$gr(0))
  res61 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res61, x = 1e-3, f = 0.99945, df = -0.29888, nfev = 1)
  res62 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res62, x = 1e-1, f = 0.99817, df = -0.0089383, nfev = 1)
  res63 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e1, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res63, x = 0.43374, f = 0.99521, df = -0.0087974, nfev = 3)
  res64 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e3, c1 = 0.001, LS_interp = 1, LS_multi = 1)
  expect_step(res64, x = 0.70026, f = 0.99290, df = -0.0083960, nfev = 5)
})


# Fixed back stepping (halving) - LS_multi is not used

# Table 1
test_that("Table 1 BT/Fixed", {
  pv1 <- -f1$gr(0)/abs(f1$gr(0))
  res11 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-3, c1 = 0.001, LS_interp = 0)
  expect_step(res11, x = 1e-3, f = -5e-4, df = -0.5, nfev = 1)
  res12 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e-1, c1 = 0.001, LS_interp = 0)
  expect_step(res12, x = 1e-1, f = -0.049751, df = -0.49256, nfev = 1)
  res13 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e1, c1 = 0.001, LS_interp = 0)
  expect_step(res13, x = 1e1, f = -0.098039, df =  0.0094195, nfev = 1)
  res14 <- mfls(fg = f1, x = 0, pv = pv1, alpha = 1e3, c1 = 0.001, LS_interp = 0)
  expect_step(res14, x = 31.250, f = -0.031935, df = 0.0010177, nfev = 6)
})

# Table 2
test_that("Table 2 BT/Fixed", {
  pv2 <- -f2$gr(0)/abs(f2$gr(0))
  res21 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-3, c1 = 0.1, LS_interp = 0)
  expect_step(res21, x = 0.001, f = -1.2469e-9, df = -9.9688e-007, nfev = 1)
  res22 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e-1, c1 = 0.1, LS_interp = 0)
  expect_step(res22, x = 0.1, f = -2.2181e-4, df = -0.008414, nfev = 1)
  res23 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e1, c1 = 0.1, LS_interp = 0)
  expect_step(res23, x = 1.25, f = -1.8447, df = -3.4114, nfev = 4)
  res24 <- mfls(fg = f2, x = 0, pv = pv2, alpha = 1e3, c1 = 0.1, LS_interp = 0)
  expect_step(res24, x = 1.9531, f = -0.62904, df = 13.386, nfev = 10)
})

# Table 3
test_that("Table 3 BT/Fixed", {
  pv3 <- -f3$gr(0)/abs(f3$gr(0))
  res31 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-3, c1 = 0.1, LS_interp = 0)
  expect_step(res31, x = 1e-3, f = 0.99999, df =  -0.011857, nfev = 1)
  res32 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e-1, c1 = 0.1, LS_interp = 0)
  expect_step(res32, x = 1e-1, f =  0.89747, df = -0.022189, nfev = 1)
  res33 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e1, c1 = 0.1, LS_interp = 0)
  expect_step(res33, x = 1.25, f = 0.26493, df = 1.3789, nfev = 4)
  res34 <- mfls(fg = f3, x = 0, pv = pv3, alpha = 1e3, c1 = 0.1, LS_interp = 0)
  expect_step(res34, x = 1.9531, f = 0.95744, df = 1.9541, nfev = 10)
})

# Table 4
test_that("Table 4 BT/Fixed", {
  pv4 <- -f4$gr(0)/abs(f4$gr(0))
  res41 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-3, c1 = 0.001, LS_interp = 0)
  expect_step(res41, x = 1e-3, f = 0.99941, df = -0.29260, nfev = 1)
  res42 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e-1, c1 = 0.001, LS_interp = 0)
  expect_step(res42, x = 1e-1, f = 0.99901, df = -4.9330e-005, nfev = 1)
  res43 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e1, c1 = 0.001, LS_interp = 0)
  expect_step(res43, x = 0.625, f = 0.99900, df = 2.2733e-006, nfev = 5)
  res44 <- mfls(fg = f4, x = 0, pv = pv4, alpha = 1e3, c1 = 0.001, LS_interp = 0)
  expect_step(res44, x = 0.97656, f = 0.99902, df = 9.0755e-004, nfev = 11)
})

# Table 5
test_that("Table 5 BT/Fixed", {
  pv5 <- -f5$gr(0)/abs(f5$gr(0))
  res51 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-3, c1 = 0.001, LS_interp = 0)
  expect_step(res51, x = 1e-3, f = 0.99910, df = -0.89065, nfev = 1)
  res52 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e-1, c1 = 0.001, LS_interp = 0)
  expect_step(res52, x = 1e-1, f = 0.99144, df = 0.0039933, nfev = 1)
  res53 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e1, c1 = 0.001, LS_interp = 0)
  expect_step(res53, x = 0.625, f = 0.99573, df = 0.0088262, nfev = 5)
  res54 <- mfls(fg = f5, x = 0, pv = pv5, alpha = 1e3, c1 = 0.001, LS_interp = 0)
  expect_step(res54, x = 0.97656, f = 0.99886, df = 0.0097981, nfev = 11)
})

# Table 6
test_that("Table 6 BT/Fixed", {
  pv6 <- -f6$gr(0)/abs(f6$gr(0))
  res61 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-3, c1 = 0.001, LS_interp = 0)
  expect_step(res61, x = 1e-3, f = 0.99945, df = -0.29888, nfev = 1)
  res62 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e-1, c1 = 0.001, LS_interp = 0)
  expect_step(res62, x = 1e-1, f = 0.99817, df = -0.0089383, nfev = 1)
  res63 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e1, c1 = 0.001, LS_interp = 0)
  expect_step(res63, x = 0.625, f = 0.99354, df = -0.0085968, nfev = 5)
  res64 <- mfls(fg = f6, x = 0, pv = pv6, alpha = 1e3, c1 = 0.001, LS_interp = 0)
  expect_step(res64, x = 0.97656, f = 0.99230, df = 0.071191, nfev = 11)
})
