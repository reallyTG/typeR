context("Nesterov Momentum")

# From the table in https://jlmelville.github.io/mize/nesterov.html
# Uses R code, but nothing from mize
test_that("classical momentum with constant step size", {
  res <- mize(rb0, rosenbrock_fg, method = "MOM", line_search = "constant",
              step0 = 0.001, mom_schedule = 0.95, max_iter = 5,
              store_progress = TRUE, use_init_mom = TRUE)

  expect_equal(res$progress$f, c(24.20, 5.35, 25.54, 22.49, 4.32, 18.83),
               tol = 1e-3)
})

# Use Nesterovized momentum (useful if method is e.g. DBD)
test_that("nesterov momentum with constant step size", {
  res <- mize(rb0, rosenbrock_fg, method = "MOM", line_search = "constant",
              step0 = 0.001, mom_type = "nesterov", mom_schedule = 0.95,
              max_iter = 5, store_progress = TRUE, use_init_mom = TRUE)

  expect_equal(res$progress$f, c(24.20, 34.96, 7.04, 5.02, 3.85, 3.75),
               tol = 1e-3)
})

# Use NAG method directly
test_that("NAG with constant step size", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG", line_search = "constant",
              step0 = 0.001, mom_schedule = 0.95,
              max_iter = 5, store_progress = TRUE, use_init_mom = TRUE)

  expect_equal(res$progress$f, c(24.20, 34.96, 7.04, 5.02, 3.85, 3.75),
               tol = 1e-3)
})

test_that("classical momentum  using initial momentum should make no difference", {
  res <- mize(rb0, rosenbrock_fg, method = "MOM", line_search = "constant",
              step0 = 0.001, mom_schedule = 0.95, max_iter = 5,
              store_progress = TRUE, use_init_mom = FALSE)

  expect_equal(res$progress$f, c(24.20, 5.35, 25.54, 22.49, 4.32, 18.83),
               tol = 1e-3)
})

# Use Nesterovized momentum
test_that("nesterov momentum with constant step size force gradient descent first iteration", {
  res <- mize(rb0, rosenbrock_fg, method = "MOM", line_search = "constant",
              step0 = 0.001, mom_type = "nesterov", mom_schedule = 0.95,
              max_iter = 5, store_progress = TRUE, use_init_mom = FALSE)

  expect_equal(res$progress$f, c(24.20, 5.35, 5.26, 4.13, 4.10, 4.07),
               tol = 1e-3)
})

# Use NAG method directly
test_that("NAG with constant step size force gradient descent first iteration", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG", line_search = "constant",
              step0 = 0.001, mom_schedule = 0.95,
              max_iter = 5, store_progress = TRUE, use_init_mom = FALSE)

  expect_equal(res$progress$f, c(24.20, 5.35, 5.26, 4.13, 4.10, 4.07),
               tol = 1e-3)
})
