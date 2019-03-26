context("API tests")

# Repeat some of the basic tests, using the consumer API
test_that("steepest descent with constant step size", {
  res <- mize(rb0, rosenbrock_fg, method = "SD", max_iter = 3,
               line_search = "const", step0 = 0.0001, grad_tol = 1e-5,
               check_conv_every = NULL)

  expect_equal(res$nf, 1)
  expect_equal(res$ng, 4)
  expect_equal(res$f, 12.81, tol = 1e-3)
  expect_equal(res$g2n, 147.11, tol = 1e-3)
  expect_equal(res$par, c(-1.144, 1.023), tol = 1e-3)
})

test_that("grad norm not returned (or calculated) if grad tol is NULL", {
  res <- mize(rb0, rosenbrock_fg, method = "SD", max_iter = 3,
               line_search = "const", step0 = 0.0001, grad_tol = NULL,
               check_conv_every = NULL)

  expect_equal(res$nf, 1)
  expect_equal(res$ng, 3)
  expect_equal(res$f, 12.81, tol = 1e-3)
  expect_true(is.null(res$g2n))
  expect_equal(res$par, c(-1.144, 1.023), tol = 1e-3)
})


test_that("L-BFGS with More-Thuente LS", {
  # can abbreviate line search name and initializer
  res <- mize(rb0, rosen_no_hess, method = "L-BFGS", max_iter = 3,
               line_search = "mo", c1 = 5e-10, c2 = 1e-9, step0 = "scipy",
               step_next_init = "q", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 17)
  expect_equal(res$ng, 17)
  expect_equal(res$f, 3.53, tol = 1e-3)
  expect_equal(res$g2n, 24.98, tol = 1e-3)
  expect_equal(res$par, c(-0.785, 0.558), tol = 1e-3)
})

test_that("L-BFGS with More-Thuente LS and inv Hess initial guess", {
  res <- mize(rb0, rosenbrock_fg, method = "L-BFGS", max_iter = 3,
              line_search = "mo", c1 = 5e-10, c2 = 1e-9, step0 = "scipy",
              step_next_init = "q", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 19)
  expect_equal(res$ng, 19)
  expect_equal(res$f, 3.71, tol = 1e-3)
  expect_equal(res$g2n, 27.40, tol = 1e-3)
  expect_equal(res$par, c(-0.820, 0.610), tol = 1e-3)
})


test_that("L-BFGS with More-Thuente LS and max alpha guess increase", {
  # can abbreviate line search name and initializer
  res <- mize(rb0, rosen_no_hess, method = "L-BFGS", max_iter = 3,
              line_search = "mo", c1 = 5e-10, c2 = 1e-9, step0 = "scipy",
              step_next_init = "q", scale_hess = FALSE, grad_tol = 1e-5,
              ls_max_alpha_mult = 2)
  # Get to the same result as without ls_max_alpha_mult but more evaluations
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 3.53, tol = 1e-3)
  expect_equal(res$g2n, 24.98, tol = 1e-3)
  expect_equal(res$par, c(-0.785, 0.558), tol = 1e-3)
})


test_that("BFGS with Hessian inverse diagonal", {
  res <- mize(rb0, rosenbrock_fg, method = "BFGS", max_iter = 3,
              line_search = "more-thuente", c1 = 5e-10, c2 = 1e-9,
              step0 = "sci", ls_max_alpha = 0.5,
              step_next_init = "quad", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 4)
  expect_equal(res$ng, 4)
  expect_equal(res$f, 4.461, tol = 1e-3)
  expect_equal(res$g2n, 6.524, tol = 1e-3)
  expect_equal(res$par, c(-1.112, 1.231), tol = 1e-3)
})

test_that("BFGS with Hessian inverse matrix", {
  rb_hi <- rosenbrock_fg
  rb_hi$hi <- function(par) { solve(rosenbrock_fg$hs(par)) }
  res <- mize(rb0, rb_hi, method = "BFGS", max_iter = 3,
              line_search = "more-thuente", c1 = 5e-10, c2 = 1e-9,
              step0 = "sci", ls_max_alpha = 0.5,
              step_next_init = "quad", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 4)
  expect_equal(res$ng, 4)
  expect_equal(res$f, 4.968, tol = 1e-3)
  expect_equal(res$g2n, 31.81, tol = 1e-3)
  expect_equal(res$par, c(-1.160, 1.290), tol = 1e-3)
})

test_that("BFGS with More-Thuente LS and max alpha", {
  res <- mize(rb0, rosen_no_hess, method = "BFGS", max_iter = 3,
              line_search = "more-thuente", c1 = 5e-10, c2 = 1e-9,
              step0 = "sci", ls_max_alpha = 0.5,
              step_next_init = "quad", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 14)
  expect_equal(res$ng, 14)
  expect_equal(res$f, 3.726, tol = 1e-3)
  expect_equal(res$g2n, 18.83, tol = 1e-3)
  expect_equal(res$par, c(-0.893, 0.760), tol = 1e-3)
})

test_that("BFGS with More-Thuente LS and fixed initial alpha guess", {
  res <- mize(rb0, rosen_no_hess, method = "BFGS", max_iter = 3,
              line_search = "more-thuente", c1 = 5e-10, c2 = 1e-9,
              step0 = "sci",
              step_next_init = 0.1, scale_hess = FALSE, grad_tol = 1e-5)
  # Get to the same result as without step_next_init but more evaluations
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 3.53, tol = 1e-3)
  expect_equal(res$g2n, 24.98, tol = 1e-3)
  expect_equal(res$par, c(-0.785, 0.558), tol = 1e-3)
})

test_that("SR1 with More-Thuente LS", {
  res <- mize(rb0, rosen_no_hess, method = "SR1", max_iter = 3,
              line_search = "more-thuente", c1 = 1e-4, c2 = 0.9,
              step0 = "sci",
              step_next_init = "quad", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 6)
  expect_equal(res$ng, 6)
  expect_equal(res$f, 3.47, tol = 1e-3)
  expect_equal(res$g2n, 17.87, tol = 1e-3)
  expect_equal(res$par, c(-0.824, 0.641), tol = 1e-3)
})

test_that("SR1 with approx Hessian init", {
  res <- mize(rb0, rosenbrock_fg, method = "SR1", max_iter = 3,
              line_search = "more-thuente", c1 = 1e-4, c2 = 0.9,
              step0 = "sci",
              step_next_init = "quad", scale_hess = FALSE, grad_tol = 1e-5)

  expect_equal(res$nf, 4)
  expect_equal(res$ng, 4)
  expect_equal(res$f, 4.432, tol = 1e-3)
  expect_equal(res$g2n, 5.289, tol = 1e-3)
  expect_equal(res$par, c(-1.105, 1.219), tol = 1e-3)
})

test_that("CG with Schmidt LS", {
  # lower case names should be ok for method, cg_update, step0 etc.
  res <- mize(rb0, rosenbrock_fg, method = "cg",
              cg_update = "pr+",
              max_iter = 3,
              line_search = "schmidt", c1 = 1e-4, c2 = 0.1, step0 = "schmidt",
              step_next_init = "slope", ls_max_alpha_mult = 10,
              grad_tol = 1e-5)

  expect_equal(res$nf, 10)
  expect_equal(res$ng, 10)
  expect_equal(res$f, 2.859, tol = 1e-3)
  expect_equal(res$g2n, 3.650, tol = 1e-3)
  expect_equal(res$par, c(-0.682, 0.483), tol = 1e-3)
})

test_that("CG with Rasmussen LS", {
  # lower case names should be ok for method, cg_update, step0 etc.
  res <- mize(rb0, rosenbrock_fg, method = "cg",
              cg_update = "pr+",
              max_iter = 3,
              line_search = "ras", c1 = 5e-10, c2 = 1e-9, step0 = "ras",
              step_next_init = "slope", ls_max_alpha_mult = 10,
              grad_tol = 1e-5)

  expect_equal(res$nf, 27)
  expect_equal(res$ng, 27)
  expect_equal(res$f, 3.53, tol = 1e-3)
  expect_equal(res$g2n, 24.98, tol = 1e-3)
  expect_equal(res$par, c(-0.785, 0.558), tol = 1e-3)
})

test_that("HZ CG with HZ LS", {
  # Also use HZ suggestions for initial step guess and next step guess
  # (the latter of which costs an extra fn evaluation per iteration)
  res <- mize(rb0, rosenbrock_fg, method = "cg",
              cg_update = "hz+",
              max_iter = 3,
              line_search = "hz", c1 = 5e-10, c2 = 1e-9, step0 = "hz",
              step_next_init = "hz", grad_tol = 1e-5)

  expect_equal(res$nf, 10)
  expect_equal(res$ng, 8)
  expect_equal(res$f, 4.09, tol = 1e-3)
  expect_equal(res$g2n, 1.789, tol = 1e-3)
  expect_equal(res$par, c(-1.020, 1.050), tol = 1e-3)
})


test_that("CG with Rasmussen LS and max_fn termination", {
  res <- mize(rb0, rosenbrock_fg, method = "cg",
              cg_update = "pr+",
              max_iter = 3, max_fn = 20, ls_max_alpha_mult = 10,
              line_search = "ras", c1 = 5e-10, c2 = 1e-9, step0 = "ras",
              step_next_init = "slope", grad_tol = 1e-5)

  expect_equal(res$nf, 20)
  expect_equal(res$ng, 20)
  expect_equal(res$f, 3.54, tol = 1e-3)
  expect_equal(res$g2n, 23.23, tol = 1e-3)
  expect_equal(res$par, c(-0.806, 0.596), tol = 1e-3)
})


test_that("NAG with Rasmussen LS", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG",
              nest_convex_approx = FALSE, nest_q = 0, nest_burn_in = 0,
              max_iter = 3,
              line_search = "rasmussen", c1 = 5e-10, c2 = 1e-9,
              step0 = "rasmussen",
              step_next_init = "slope", ls_max_alpha_mult = 10,
              grad_tol = 1e-5)

  expect_equal(res$nf, 29)
  expect_equal(res$ng, 29)
  expect_equal(res$f, 3.56, tol = 1e-3)
  expect_equal(res$g2n, 7.2, tol = 1e-3)
  expect_equal(res$par, c(-0.869, 0.781), tol = 1e-3)
})

test_that("bold driver SD and classical momentum", {
  res <- mize(rb0, rosenbrock_fg,
               method = "SD", norm_direction = TRUE,
               line_search = "bold",
               mom_type = "classical",
               mom_schedule = "ramp", mom_init = 0.1, mom_final = 0.3,
               max_iter = 3, grad_tol = 1e-5)

  expect_equal(res$nf, 12)
  expect_equal(res$ng, 5) # extra grad eval needed to get data for best found
  expect_equal(res$f, 4.38, tol = 1e-3)
  expect_equal(res$g2n, 23.21, tol = 1e-3)
  expect_equal(res$par, c(-1.006, 1.071), tol = 1e-3)
})

test_that("bold driver SD and nesterov momentum", {
  res <- mize(rb0, rosenbrock_fg,
               method = "SD", norm_direction = TRUE,
               line_search = "bold",
               mom_type = "nesterov",
               mom_schedule = "ramp", mom_init = 0.1, mom_final = 0.3,
               max_iter = 3, grad_tol = 1e-5)

  expect_equal(res$nf, 12)
  expect_equal(res$ng, 5)
  expect_equal(res$f, 4.38, tol = 1e-3)
  expect_equal(res$g2n, 23.21, tol = 1e-3)
  expect_equal(res$par, c(-1.006, 1.071), tol = 1e-3)
})

test_that("Delta bar delta adaptive learning rate and nesterov momentum", {
  res <- mize(rb0, rosenbrock_fg,
               method = "DBD", norm_direction = TRUE,
               step0 = 0.1,
               mom_type = "nesterov",
               mom_schedule = 0.2,
               max_iter = 3, grad_tol = 1e-5, rel_tol = NULL, abs_tol = NULL)

  expect_equal(res$nf, 1)
  expect_equal(res$ng, 4)
  expect_equal(res$f, 4.84, tol = 1e-3)
  expect_equal(res$g2n, 37.85, tol = 1e-3)
  expect_equal(res$par, c(-0.993, 1.079), tol = 1e-3)
})

test_that("Terminates semi-gracefully if function value is non-finite", {
  res <- mize(rb0, rosenbrock_fg, "DBD", step0 = 1, check_conv_every = 1)
  expect_equal(res$terminate$what, "fn_inf")
  expect_equal(res$iter, 4)
})

test_that("Terminates semi-gracefully if gradient is non-finite", {
  # If we don't check convergence often enough, solution can diverge
  # in between checks. If NaN is detected in a gradient calculation, we
  # terminate early even if not on a convergence check iteration
  res <- mize(rb0, rosenbrock_fg, "DBD", step0 = 1, check_conv_every = 10)
  expect_equal(res$terminate$what, "gr_inf")
  expect_equal(res$iter, 6)
})

test_that("Step tolerance is triggered when progress stalls", {
  # NULL abs_tol to stop it from triggering before step_tol
  res <- mize(rb0, rosen_no_hess, "L-BFGS", memory = 5, abs_tol = NULL,
              step_tol = 1e-7, step_next_init = "quad",
              step0 = 1)
  expect_equal(res$nf, 57)
  expect_equal(res$ng, 57)
  expect_equal(res$f, 0, tol = 1e-3)
  expect_equal(res$par, c(1, 1))
  expect_equal(res$terminate$what, "step_tol")
})

test_that("Step tolerance is not triggered when restarting", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG", max_iter = 55, restart = "fn",
              store_progress = TRUE)
  expect_equal(res$iter, 55)
  expect_equal(res$progress["52", "step"], 0)
  expect_equal(res$terminate$what, "max_iter")
})

test_that("max_fn errs on the side of caution", {
  # In this test we ask for 15 function evaluations, but only get 14
  # this is because we need one function evaluation spare to calculate
  # f for the return value and mize has determined it isn't available
  # for "free" by being calculated during the iteration
  res <- mize(rb0, rosenbrock_fg, method = "NAG", max_fn = 15,
              step_next_init = "slope",
              ls_max_alpha_mult = 10)
  expect_equal(res$terminate$what, "max_fn")
  expect_equal(res$terminate$val, 14)
  expect_equal(res$nf, 14)
  expect_equal(res$f, 4.08, tol = 1e-3)
})

test_that("max_fg also errs on the side of caution", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG", max_fg = 30,
              step_next_init = "slope", ls_max_alpha_mult = 10)
  expect_equal(res$terminate$what, "max_fg")
  expect_equal(res$terminate$val, 29)
  expect_equal(res$nf, 15)
  expect_equal(res$ng, 14)
  expect_equal(res$f, 4.08, tol = 1e-3)
})

test_that("max_fn with DBD", {
  # Don't leave one function evaluation spare with DBD because it
  # doesn't use them during its iteration
  res <- mize(rb0, rosenbrock_fg, method = "DBD", max_fn = 30)
  expect_equal(res$terminate$what, "max_fn")
  expect_equal(res$terminate$val, 30)
  expect_equal(res$nf, 30)
  expect_equal(res$ng, 30)
  expect_equal(res$f, 4.133, tol = 1e-3)
})

test_that("max_fg with DBD", {
  res <- mize(rb0, rosenbrock_fg, method = "DBD", max_fg = 30)
  expect_equal(res$terminate$what, "max_fg")
  expect_equal(res$terminate$val, 30)
  expect_equal(res$nf, 15)
  expect_equal(res$ng, 15)
  expect_equal(res$f, 7.914, tol = 1e-3)
})

test_that("max functions per line search", {
  # This starts at the minimum and probably due to a lack of smoothness
  # at the minimum due to floating point issues rather than the function itself,
  # doesn't make a lot of progress - but at least stops after 20 steps
  # without a max on the line search, this can take 100s of steps to give up
  # (or worse)
  res <- mize(c(3, 0.5), tricky_fg(), method = "SD", ls_max_fn = 20)
  expect_equal(res$terminate$what, "step_tol")
  expect_equal(res$terminate$val, 0)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 0, tol = 1e-3)
})

test_that("backtracking line search", {
  res <- mize(rb0, rosenbrock_fg, method = "NAG", line_search = "BACK",
              max_iter = 3, step_next_init = "slope")
  expect_equal(res$nf, 7)
  expect_equal(res$ng, 6)
  expect_equal(res$f, 20.44, tol = 1e-3)
  expect_equal(res$par, c(-1.184, 1.006), tol = 1e-3)
})

test_that("MT safeguard cubic", {
  # Chosen only because I couldn't find a simpler example that yielded a
  # difference
  res <- mize(rb0, rosenbrock_fg, method = "CG", c2 = 0.9, grad_tol = 0.1,
              max_iter = 11, ls_safe_cubic = TRUE)
  # These three should be different from ls_safe_cubic = FALSE
  expect_equal(res$nf, 25) # 24 otherwise
  expect_equal(res$ng, 25)
  expect_equal(res$g2n, 4.604, tol = 1e-3) # approx 4.627 otherwise

  # These are the same within tolerance
  expect_equal(res$f, 2.8, tol = 1e-3)
  expect_equal(res$par, c(-0.6605, 0.4568), tol = 1e-3)
})

test_that("Truncated Newton with constant step size", {
  res <- mize(rb0, rosenbrock_fg, method = "TN", max_iter = 3,
              line_search = "const", step0 = 1, grad_tol = 1e-5,
              check_conv_every = NULL)

  expect_equal(res$nf, 1)
  expect_equal(res$ng, 8)
  expect_equal(res$f, 4.118, tol = 1e-3)
  expect_equal(res$g2n, 4.219, tol = 1e-3)
  expect_equal(res$par, c(-1.023, 1.062), tol = 1e-3)
})

# Ensure TN direction can't exceed gr budget
test_that("Truncated Newton with max_gr", {
  res <- mize(rb0, rosenbrock_fg, method = "TN", max_iter = 3,
              check_conv_every = NULL, line_search = "const", step0 = 1,
              max_gr = 6)

  # Should give the same f/par results as without max_gr, as we would quit with -ve
  # curvature anyway
  expect_equal(res$nf, 1)
  # If grad_tol or ginf_tol was calculated we would get max_gr + 1
  expect_equal(res$ng, 6)
  expect_equal(res$f, 4.118, tol = 1e-3)
  expect_equal(res$par, c(-1.023, 1.062), tol = 1e-3)
})
