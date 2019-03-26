context("Basic Tests")
test_that("steepest descent with constant step size", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = constant_step_size(
          value = 0.0001)),
    verbose = FALSE))

  opt$count_res_fg <- FALSE
  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE,
                 verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 19.18, 15.52, 12.81)
  g2ns <- c(232.87, 198.56, 170.43, 147.11)
  steps <- c(0, 0.0233, 0.0199, 0.017) # step size is multiplied by gradient!
  par <- c(-1.144, 1.023)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)

  expect_equal(res$f, min(res$progress$f))
  expect_equal(res$g2n, min(res$progress$g2n))
  expect_equal(res$nf, nfs[length(nfs)])
  expect_equal(res$ng, ngs[length(ngs)])
})

test_that("counting result fun grad calls increases counts", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = constant_step_size(
          value = 0.0001)),
      verbose = FALSE))

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                  store_progress = TRUE,
                  verbose = FALSE,
                  grad_tol = 1e-5)

  # extra f and g calls are recorded corresponding to generating progress
  # data (including during iteration 0)
  nfs <- c(1, 2, 3, 4)
  ngs <- c(1, 2, 3, 4)

  fs <- c(24.2, 19.18, 15.52, 12.81)
  g2ns <- c(232.87, 198.56, 170.43, 147.11)
  steps <- c(0, 0.0233, 0.0199, 0.017)
  par <- c(-1.144, 1.023)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)

  expect_equal(res$f, min(res$progress$f))
  expect_equal(res$g2n, min(res$progress$g2n))
  expect_equal(res$nf, nfs[length(nfs)])
  expect_equal(res$ng, ngs[length(ngs)])
})

test_that("can check convergence less often and get fewer fn/gr calls", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = constant_step_size(
          value = 0.0001)),
      verbose = FALSE))

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                  store_progress = TRUE,
                  verbose = FALSE, grad_tol = 1e-5, check_conv_every = 1000)

  # fewer stored progress values first and last iter only
  # same number of gradient evaluations, but fewer total function evaluations
  progress_iters <- c("0", "3")
  nfs <- c(1, 2)
  ngs <- c(1, 4)

  fs <- c(24.2, 12.81)
  g2ns <- c(232.87, 147.11)
  steps <- c(0, 0.017)
  par <- c(-1.144, 1.023)

  expect_equal(rownames(res$progress), progress_iters)
  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)

  expect_equal(res$f, min(res$progress$f))
  expect_equal(res$g2n, min(res$progress$g2n))
  expect_equal(res$nf, nfs[length(nfs)])
  expect_equal(res$ng, ngs[length(ngs)])
})

test_that("no grad norm returned or stored in progress when grad_tol is NULL", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = constant_step_size(
          value = 0.0001)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                  store_progress = TRUE,
                  verbose = FALSE, grad_tol = NULL)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 19.18, 15.52, 12.81)
  steps <- c(0, 0.0233, 0.0199, 0.017)
  par <- c(-1.144, 1.023)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_true(is.null(res$progress$g2n))
  expect_true(is.null(res$g2n))
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("steepest descent with constant step size and normalized direction", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.0001)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 24.18, 24.15, 24.13)
  g2ns <- c(232.87, 232.72, 232.57, 232.42)
  steps <- c(0, 1e-4, 1e-4, 1e-4)
  par <- c(-1.2, 1.0)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("steepest descent with bold driver", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver(
          init_step_size = 1)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 7, 12)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 4.12, 4.11)
  g2ns <- c(232.87, 64.72, 2.90, 2.39)
  steps <- c(0, 0.25, 0.069, 0.0047)
  par <- c(-1.024, 1.060)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})


test_that("classical momentum with 0 step size should be like using no momentum", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 19.84, 17.88)
  g2ns <- c(232.87, 217.96, 203.31, 188.93)
  steps <- c(0, 1e-2, 1e-2, 1e-2)
  mus <- c(0, 0, 0, 0)
  par <- c(-1.172, 1.011)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with constant step size", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 19.44, 17.06)
  g2ns <- c(232.87, 217.96, 200.42, 182.69)
  steps <- c(0, 0.01, 0.012, 0.0124)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.168, 1.013)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("eager classical momentum with constant step size should give same results as non-eager", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE
  opt$eager_update <- TRUE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 19.44, 17.06)
  g2ns <- c(232.87, 217.96, 200.42, 182.69)
  steps <- c(0, 0.01, 0.012, 0.0124)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.168, 1.013)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})


test_that("classical momentum with bold driver", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 8, 10)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 5.25, 4.62)
  g2ns <- c(232.87, 64.72, 47.19, 33.88)
  steps <- c(0, 0.25, 0.020, 0.0795)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.051, 1.040)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("eager classical momentum with bold driver same as 'lazy' result", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))

  opt$eager_update <- TRUE
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 8, 10)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 5.25, 4.62)
  g2ns <- c(232.87, 64.72, 47.19, 33.88)
  steps <- c(0, 0.25, 0.020, 0.0795)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.051, 1.040)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("linear weighted classical momentum with bold driver", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt <- append_stage(opt, momentum_correction_stage())

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 10, 12)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 4.27, 5.04, 4.67)
  g2ns <- c(232.87, 17.16, 42.78, 33.27)
  steps <- c(0, 0.2, 0.027, 0.01)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-0.998, 1.078)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("linear weighted eager classical momentum with bold driver", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))

  opt <- append_stage(opt, momentum_correction_stage())

  opt$count_res_fg <- FALSE
  opt$eager_update <- TRUE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 10, 12)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 4.27, 5.04, 4.67)
  g2ns <- c(232.87, 17.16, 42.78, 33.27)
  steps <- c(0, 0.2, 0.027, 0.01)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-0.998, 1.078)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("bold classical momentum with bold driver", {
  # Not a very good idea - momentum component easily shrinks to zero
  # so you waste a lot of time trying to find a non-existent acceptable step
  # size - but tests that you can use the same step size method in different
  # stages and they don't interfere with each other.
  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(normalize = TRUE),
        step_size = bold_driver()),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 6, 19, 45)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 4.12, 4.10)
  g2ns <- c(232.87, 64.72, 2.81, 2.41)
  steps <- c(0, 0.25, 0.064, 0.0047)
  mus <- c(1, 1.1, 4.73e-3, 1.64e-8)
  par <- c(-1.027, 1.059)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("bold classical momentum with bold driver without cache gives same results, but requires extra work", {
  # Checks that the caching of function calls works correctly
  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(normalize = TRUE),
        step_size = bold_driver()),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE,
                 invalidate_cache = TRUE, grad_tol = 1e-5)

  nfs <- c(0, 6, 20, 47) # extra function evaluations
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 4.12, 4.10)
  g2ns <- c(232.87, 64.72, 2.81, 2.41)
  steps <- c(0, 0.25, 0.064, 0.0047)
  mus <- c(1, 1.1, 4.73e-3, 1.64e-8)
  par <- c(-1.027, 1.059)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with bold driver and fn adaptive restart, same results as without when everything is ok", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt <- adaptive_restart(opt, "fn")

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  # Have to carry out one extra fn evaluation when doing the first validation
  # After that, bold driver doesn't need to do a calculation for f0 on the
  # subsequent step
  nfs <- c(0, 5, 9, 11)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 5.25, 4.62)
  g2ns <- c(232.87, 64.72, 47.19, 33.88)
  steps <- c(0, 0.25, 0.020, 0.0795)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.051, 1.040)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with bold driver and gr adaptive restart, same results as without when everything is ok", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt <- adaptive_restart(opt, "gr")

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  # Get adaptive update check for free if using gradient!
  nfs <- c(0, 4, 8, 10)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 5.25, 4.62)
  g2ns <- c(232.87, 64.72, 47.19, 33.88)
  steps <- c(0, 0.25, 0.020, 0.0795)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.051, 1.040)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with bold driver aggressive momentum can cause cost increase", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.4
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 8, 10)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 8.71, 4.69)
  g2ns <- c(232.87, 64.72, 91.13, 34.39)
  steps <- c(0, 0.25, 0.033, 0.064)
  mus <- c(0.4, 0.4, 0.4, 0.4)
  par <- c(-0.989, 1.064)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with bold driver adaptive gr momentum prevents cost increase", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.4
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt <- adaptive_restart(opt, "gr")

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 8, 10)
  ngs <- c(0, 1, 2, 2) # no grad calc needed on repeated step
  fs <- c(24.2, 6.32, 6.32, 4.12)
  g2ns <- c(232.87, 64.72, 64.72, 2.90)
  steps <- c(0, 0.25, 0, 0.069)
  mus <- c(0.4, 0.4, 0.4, 0.4)
  par <- c(-1.029, 1.061)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with bold driver adaptive fn momentum prevents cost increase", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.4
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt <- adaptive_restart(opt, "fn")

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 5, 9, 11)
  ngs <- c(0, 1, 2, 2) # no grad calc needed on repeated step
  fs <- c(24.2, 6.32, 6.32, 4.12)
  g2ns <- c(232.87, 64.72, 64.72, 2.90)
  steps <- c(0, 0.25, 0, 0.069)
  mus <- c(0.4, 0.4, 0.4, 0.4)
  par <- c(-1.029, 1.061)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with constant function factory", {

  # should give same results as using constant step size

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = make_momentum_step(
          make_constant(
            value = 0.2
          ),
          use_init_mom = TRUE)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 19.44, 17.06)
  g2ns <- c(232.87, 217.96, 200.42, 182.69)
  steps <- c(0, 0.01, 0.012, 0.0124)
  mus <- c(0, 0.2, 0.2, 0.2)
  par <- c(-1.168, 1.013)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with ramp function", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = make_momentum_step(
          make_ramp(
            init_value = 0.1,
            final_value = 0.3,
            wait = 0
          ),
          use_init_mom = TRUE)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 19.44, 16.84)
  g2ns <- c(232.87, 217.96, 200.42, 181.00)
  steps <- c(0, 0.01, 0.012, 0.0136)
  mus <- c(0, 0.1, 0.2, 0.3)
  par <- c(-1.167, 1.014)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("classical momentum with switch function", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = constant_step_size(
          value = 0.01)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = make_momentum_step(
          make_switch(
            init_value = 0.5,
            final_value = 0.8,
            switch_iter = 2
          ),
          use_init_mom = TRUE)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 21.95, 18.26, 14.00)
  g2ns <- c(232.87, 217.96, 191.79, 157.67)
  steps <- c(0, 0.01, 0.018, 0.0244)
  mus <- c(0, 0.5, 0.8, 0.8)
  par <- c(-1.152, 1.020)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("sutskever nesterov momentum with bold driver", {

  opt <- make_opt(
    make_stages(
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt$eager_update <- TRUE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 4, 7, 10)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 4.33, 4.78)
  g2ns <- c(232.87, 64.72, 22.22, 36.89)
  steps <- c(0, 0.25, 0.088, 0.0584)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.042, 1.046) # best par, not last par!

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)

  expect_equal(res$f, min(fs), tol = 1e-3)
})

test_that("nesterov momentum with bold driver and adaptive fn", {

  opt <- make_opt(
    make_stages(
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = bold_driver()),
      verbose = FALSE))
  opt$count_res_fg <- FALSE
  opt$eager_update <- TRUE

  opt <- adaptive_restart(opt, "fn")

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 5, 8, 11)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 6.32, 4.33, 4.33)
  g2ns <- c(232.87, 64.72, 22.22, 22.22)
  steps <- c(0, 0.25, 0.088, 0)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-1.042, 1.046)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("nesterov accelerated gradient with wolfe line search", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_step()
      ),
      verbose = FALSE))

  opt$count_res_fg <- FALSE
  opt$eager_update <- TRUE
  #opt$depends <- c(opt$depends, 'log_vals')
  opt$depends <- c(opt$depends, 'keep_stage_fs')

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, ret_opt = TRUE, grad_tol = 1e-5)


  nfs <- c(0, 9, 17, 22)
  ngs <- c(0, 9, 17, 22)
  fs <- c(24.2, 4.128, 3.913, 3.558)
  g2ns <- c(232.87, 1.777, 23.908, 7.200)
  steps <- c(0, 0.184, 0.301, 0.048)
  mus <- c(0, 0, 0.282, 0.434)
  par <- c(-0.869, 0.781)
  # also records fn after gradient stage - compare with momentum-first
  # and see that these have the same values
  all_fs <- c(4.128, 4.128, 3.886, 3.913, 3.583, 3.558)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
  expect_equal(res$opt$all_fs, all_fs, tol = 1e-3)
})

test_that("nesterov momentum with wolfe line search is like NAG", {

  # Add burn_in = 2 so the first two updates are gradient-only, like NAG
  # But even then, won't give exactly same result as "real" NAG
  # because parameters are returned half-way between steps compared to real NAG
  # Uncomment the 'log_vals' hook in this and the test above to see that
  # you do get the same values for each stage

  opt <- make_opt(
    make_stages(
      momentum_stage(
        direction = momentum_direction(),
        step_size = nesterov_convex_step(burn_in = 2)),
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  opt$eager_update <- TRUE
  # Uncomment this to see the grad and mom values logged to screen
  #opt$depends <- c(opt$depends, 'log_vals')
  opt$depends <- c(opt$depends, 'keep_stage_fs')

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, ret_opt = TRUE
                 , grad_tol = 1e-5
                 )

  nfs <- c(0, 9, 17, 22)
  ngs <- c(0, 9, 17, 22)
  fs <- c(24.2, 4.128, 3.886, 3.582)
  g2ns <- c(232.87, 1.777, 18.114, 1.858)
  steps <- c(0, 0.184, 0.235, 0.0709)
  mus <- c(0, 0, 0, 0.282)
  par <- c(-0.891, 0.802)
  # compare with real NAG all_fns, after first stage, consecutive values are
  # the same
  all_fs <- c(24.2, 4.128, 4.128, 3.886, 3.913, 3.583)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
  expect_equal(res$opt$all_fs, all_fs, tol = 1e-3)
})

test_that("NAG with q = 1 is steepest descent", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_step(q = 1)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)


  nfs <- c(0, 9, 17, 22)
  ngs <- c(0, 9, 17, 22)
  fs <- c(24.2, 4.128, 3.886, 3.704)
  g2ns <- c(232.87, 1.777, 18.114, 1.843)
  steps <- c(0, 0.184, 0.235, 0.020)
  mus <- c(0, 0, 0, 0)
  par <- c(-0.923, 0.860)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("NAG with q close to 0 is the same as == 0", {

  # This should be the same as NAG with Wolfe Line Search test
  # If is exactly zero we use the slightly simpler momentum expression
  # given by Sutskever in the appendix, otherwise use the expression
  # in the Candes paper which is more complex but allows q to vary from zero

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_step(q = 1e-8)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 9, 17, 22)
  ngs <- c(0, 9, 17, 22)
  fs <- c(24.2, 4.128, 3.913, 3.558)
  g2ns <- c(232.87, 1.777, 23.908, 7.200)
  steps <- c(0, 0.184, 0.301, 0.048)
  mus <- c(0, 0, 0.282, 0.434)
  par <- c(-0.869, 0.781)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("NAG with q = 0.5 between full NAG and SD", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_step(q = 0.5)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 9, 17, 21)
  ngs <- c(0, 9, 17, 21)
  fs <- c(24.2, 4.128, 3.891, 3.664)
  g2ns <- c(232.87, 1.777, 20.711, 3.442)
  steps <- c(0, 0.184, 0.265, 0.028)
  mus <- c(0, 0, 0.128, 0.159)
  par <- c(-0.903, 0.831)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("NAG with approximate convex momentum", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_approx_step(use_init_mu = FALSE)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 9, 17, 22)
  ngs <- c(0, 9, 17, 22)
  fs <- c(24.2, 4.128, 4.004, 3.337)
  g2ns <- c(232.87, 1.777, 30.137, 7.777)
  steps <- c(0, 0.184, 0.369, 0.0999)
  # From reading the Sutskever paper, it seems to be the case that mu = 0.4
  # (from t = 0) is not intended to ever be used, so default is that mu = 0
  mus <- c(0, 0, 0.571, 0.625)
  par <- c(-0.805, 0.676)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("NAG with approximate convex momentum and mu = 0.5 at t = 1", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(),
        step_size = more_thuente_ls(c2 = 1.e-9, max_alpha_mult = 10)),
      momentum_stage(
        direction = nesterov_momentum_direction(),
        step_size = nesterov_convex_approx_step(use_init_mu = TRUE)
      ),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 9, 15, 26)
  ngs <- c(0, 9, 15, 26)
  fs <- c(24.2, 8.223, 4.097, 15.55)
  g2ns <- c(232.87, 86.69, 1.791, 77.44)
  steps <- c(0, 0.275, 0.0926, 1.703)
  # Only difference from previous test is that mu = 0.5 at t = 1
  # But affects length of gradient descent step even though velocity is 0 for
  # momentum step
  mus <- c(0, 0.5, 0.571, 0.625)
  par <- c(-0.09, -0.371)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})


# Wolfe line search
test_that("Polak Ribiere CG with Rasmussen LS", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = cg_direction(cg_update = pr_update),
        step_size = rasmussen_ls(initial_step_length = "r",
                                 max_alpha_mult = 10)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 6, 10, 12)
  ngs <- c(0, 6, 10, 12)
  fs <- c(24.2, 4.13, 3.84, 3.52)
  g2ns <- c(232.87, 1.87, 19.06, 25.24)
  steps <- c(0, 0.184, 0.273, 0.311)
  par <- c(-0.777, 0.543)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("BFGS with More-Thuente LS", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = bfgs_direction(),
        step_size = more_thuente_ls(
          c2 = 1e-9,
          initial_step_length = "sci",
          initializer = "q",
          try_newton_step = TRUE)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosen_no_hess, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 6, 11, 17)
  ngs <- c(0, 6, 11, 17)
  fs <- c(24.2, 4.13, 3.85, 3.53)
  g2ns <- c(232.87, 1.78, 18.62, 24.98)
  steps <- c(0, 0.184, 0.261, 0.307)
  par <- c(-0.785, 0.558)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})


test_that("L-BFGS with More-Thuente LS gives same results as BFGS with sufficiently high memory", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = lbfgs_direction(),
        step_size = more_thuente_ls(
          c2 = 1e-9,
          initial_step_length = "sci",
          initializer = "q",
          try_newton_step = TRUE)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosen_no_hess, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 6, 11, 17)
  ngs <- c(0, 6, 11, 17)
  fs <- c(24.2, 4.13, 3.85, 3.53)
  g2ns <- c(232.87, 1.78, 18.62, 24.98)
  steps <- c(0, 0.184, 0.261, 0.307)
  par <- c(-0.785, 0.558)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("delta bar delta adaptive learning rate", {

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = delta_bar_delta(
          epsilon = 0.1,
          kappa_fun = `*`,
          kappa = 1.1,
          phi = 0.5,
          theta = 0.2))),
      verbose = FALSE)
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 7.10, 5.28, 4.21)
  g2ns <- c(232.87, 83.18, 47.48, 13.66)
  steps <- c(0, 0.11, 0.121, 0.0605)
  par <- c(-1.040, 1.060)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("delta bar delta adaptive learning rate using momentum", {

  # similar to van der Maaten formulation in t-SNE matlab code
  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = TRUE),
        step_size = delta_bar_delta(
          epsilon = 0.1,
          use_momentum = TRUE,
          kappa_fun = `*`,
          kappa = 1.1,
          phi = 0.5)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.2
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 7.10, 6.53, 4.84)
  g2ns <- c(232.87, 83.18, 67.62, 37.87)
  steps <- c(0, 0.11, 0.143, 0.032)
  mus <- c(0.2, 0.2, 0.2, 0.2)
  par <- c(-0.993, 1.080)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("delta bar delta adaptive learning rate using momentum and additive increase", {

  # even more similar to van der Maaten formulation in t-SNE matlab code
  # in that the step length is increased with a fixed value rather than a
  # percent; also don't normalize direction vector
  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = sd_direction(normalize = FALSE),
        step_size = delta_bar_delta(
          epsilon = 0.001,
          use_momentum = TRUE,
          kappa_fun = `+`,
          kappa = 0.02,
          phi = 0.8)),
      momentum_stage(
        direction = momentum_direction(),
        step_size = constant_step_size(
          value = 0.4
        )),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, rb0, rosenbrock_fg, 3,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 1e-5)

  nfs <- c(0, 0, 0, 0)
  ngs <- c(0, 1, 2, 3)
  fs <- c(24.2, 5.59, 9.45, 6.01)
  g2ns <- c(232.87, 53.36, 97.69, 60.21)
  steps <- c(0, 0.238, 0.052, 0.044)
  mus <- c(0.4, 0.4, 0.4, 0.4)
  par <- c(-0.966, 1.079)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$progress$mu, mus, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})
