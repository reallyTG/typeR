context("External loop API")
test_that("steepest descent with constant step size", {

  opt <- make_mize(method = "SD", line_search = "const", step0 = 0.0001)

  opt <- mize_init(opt, rb0, rosenbrock_fg)
  par <- rb0
  for (iter in 1:3) {
    res <- mize_step(opt, par, rosenbrock_fg)
    par <- res$par
    opt <- res$opt
  }

  expect_equal(res$nf, 0)
  expect_equal(res$ng, 3)
  expect_equal(rosenbrock_fg$fn(par), 12.81, tol = 1e-3)
  expect_equal(norm2(rosenbrock_fg$gr(par)), 147.11, tol = 1e-3)
  expect_equal(res$par, c(-1.144, 1.023), tol = 1e-3)
})

test_that("can initialize in make_mize if par and fg are to hand", {

  opt <- make_mize(method = "SD", line_search = "const", step0 = 0.0001,
                    par = rb0, fg = rosenbrock_fg)

  par <- rb0
  for (iter in 1:3) {
    res <- mize_step(opt, par, rosenbrock_fg)
    par <- res$par
    opt <- res$opt
  }

  expect_equal(res$nf, 0)
  expect_equal(res$ng, 3)
  expect_equal(rosenbrock_fg$fn(par), 12.81, tol = 1e-3)
  expect_equal(norm2(rosenbrock_fg$gr(par)), 147.11, tol = 1e-3)
  expect_equal(res$par, c(-1.144, 1.023), tol = 1e-3)
})

test_that("reinitializing produces the same results", {
  opt <- make_mize(method = "BFGS", line_search = "more-thuente")

  opt <- mize_init(opt, rb0, rosen_no_hess)
  par <- rb0
  for (iter in 1:3) {
    res <- mize_step(opt, par, rosen_no_hess)
    par <- res$par
    opt <- res$opt
  }

  expect_equal(res$nf, 5)
  expect_equal(res$ng, 5)
  expect_equal(rosen_no_hess$fn(par), 4.28, tol = 1e-3)
  expect_equal(norm2(rosen_no_hess$gr(par)), 17.29, tol = 1e-3)
  expect_equal(res$par, c(-1.048, 1.070), tol = 1e-3)

  opt <- mize_init(opt, rb0, rosen_no_hess)
  par <- rb0
  for (iter in 1:3) {
    res <- mize_step(opt, par, rosen_no_hess)
    par <- res$par
    opt <- res$opt
  }

  # nf and ng are remembered
  expect_equal(res$nf, 10)
  expect_equal(res$ng, 10)
  expect_equal(rosen_no_hess$fn(par), 4.28, tol = 1e-3)
  expect_equal(norm2(rosen_no_hess$gr(par)), 17.29, tol = 1e-3)
  expect_equal(res$par, c(-1.048, 1.070), tol = 1e-3)
})
