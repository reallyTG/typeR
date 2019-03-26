context("PR-CG with Rasmussen step size")
test_that("CG gives same results as minimize.m webpage", {
  # example from http://learning.eng.cam.ac.uk/carl/code/minimize/
  # this has (c) 2006, earlier versions are out there with different values
  # Don't care about results after 15 iterations
  # start getting large implementation-specific results
  # subject to definitions of epsilon
  fs <- c(1.00000000000000, 0.77160942667725, 0.58224024884105,
             0.40492742502160, 0.32466327341368, 0.28960411147824,
             0.07623420070067, 0.06786211944378, 0.03378423679313,
             0.00108990808914, 0.00108795243321, 0.00008974308332,
             0.00000012183819, 0.00000000675602, 0.00000000000000,
          0)

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = cg_direction(cg_update = pr_update),
        step_size = rasmussen_ls(initial_step_length = "r",
                                 max_alpha_mult = 10)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  res <- opt_loop(opt, c(0,0), rosenbrock_fg, 15,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 0,
                 abs_tol = 0)

  # function evaluations and g2norms calculated from running minimize.m
  # in Octave
  nfs <- c(0, 6, 8, 9, 13, 16, 19, 22, 27, 31, 34, 41, 44, 46, 49, 51)
  ngs <- nfs
  g2ns <- c(2, 4.853, 7.288, 2.231, 3.540, 6.203, 3.739, 0.454, 3.098,
            0.0406, 0.0454, 0.394, 0.00518, 0.00308, 1.52e-6, 1.21e-9)
  steps <- c(0, 0.156, 0.172, 0.0892, 0.0995, 0.0860, 0.383, 0.00931,
             0.176, 0.274, 9.62e-5, 0.0651, 0.00697, 6.366e-4, 1.003e-4,
             1.167e-7)
  par <- c(1, 1)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})

test_that("CG without fg helper function gives same results", {

  fs <- c(1.00000000000000, 0.77160942667725, 0.58224024884105,
          0.40492742502160, 0.32466327341368, 0.28960411147824,
          0.07623420070067, 0.06786211944378, 0.03378423679313,
          0.00108990808914, 0.00108795243321, 0.00008974308332,
          0.00000012183819, 0.00000000675602, 0.00000000000000,
          0)

  opt <- make_opt(
    make_stages(
      gradient_stage(
        direction = cg_direction(cg_update = pr_update),
        step_size = rasmussen_ls(initial_step_length = "r",
                                 max_alpha_mult = 10)),
      verbose = FALSE))
  opt$count_res_fg <- FALSE

  rb_no_fg <- rosenbrock_fg
  rb_no_fg$fg <- NULL

  res <- opt_loop(opt, c(0,0), rb_no_fg, 15,
                 store_progress = TRUE, verbose = FALSE, grad_tol = 0,
                 abs_tol = 0)

  # function evaluations and g2norms calculated from running minimize.m
  # in Octave
  nfs <- c(0, 6, 8, 9, 13, 16, 19, 22, 27, 31, 34, 41, 44, 46, 49, 51)
  ngs <- nfs
  g2ns <- c(2, 4.853, 7.288, 2.231, 3.540, 6.203, 3.739, 0.454, 3.098,
            0.0406, 0.0454, 0.394, 0.00518, 0.00308, 1.52e-6, 1.21e-9)
  steps <- c(0, 0.156, 0.172, 0.0892, 0.0995, 0.0860, 0.383, 0.00931,
             0.176, 0.274, 9.62e-5, 0.0651, 0.00697, 6.366e-4, 1.003e-4,
             1.167e-7)
  par <- c(1, 1)

  expect_equal(res$progress$nf, nfs)
  expect_equal(res$progress$ng, ngs)
  expect_equal(res$progress$f, fs, tol = 1e-3)
  expect_equal(res$progress$g2n, g2ns, tol = 1e-3)
  expect_equal(res$progress$step, steps, tol = 1e-3)
  expect_equal(res$par, par, tol = 1e-3)
})
