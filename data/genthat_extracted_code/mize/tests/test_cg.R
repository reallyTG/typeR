context("Conjugate Gradient")

test_that("CG with different updates", {
  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "fr", grad_tol = 1e-5)
  expect_equal(res$nf, 20)
  expect_equal(res$ng, 20)
  expect_equal(res$f, 3.117, tol = 1e-3)
  expect_equal(res$g2n, 25.835, tol = 1e-3)
  expect_equal(res$par, c(-0.600, 0.286), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "cd", grad_tol = 1e-5)
  expect_equal(res$nf, 20)
  expect_equal(res$ng, 20)
  expect_equal(res$f, 3.126, tol = 1e-3)
  expect_equal(res$g2n, 25.915, tol = 1e-3)
  expect_equal(res$par, c(-0.603, 0.289), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "dy", grad_tol = 1e-5)
  expect_equal(res$nf, 20)
  expect_equal(res$ng, 20)
  expect_equal(res$f, 3.117, tol = 1e-3)
  expect_equal(res$g2n, 25.845, tol = 1e-3)
  expect_equal(res$par, c(-0.600, 0.286), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "hs", grad_tol = 1e-5)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 1.829, tol = 1e-3)
  expect_equal(res$g2n, 3.665, tol = 1e-3)
  expect_equal(res$par, c(-0.351, 0.118), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "hs+", grad_tol = 1e-5)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 1.728, tol = 1e-3)
  expect_equal(res$g2n, 2.350, tol = 1e-3)
  expect_equal(res$par, c(-0.312, 0.106), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "pr", grad_tol = 1e-5)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 1.552, tol = 1e-3)
  expect_equal(res$g2n, 3.163, tol = 1e-3)
  expect_equal(res$par, c(-0.245, 0.0547), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "pr+", grad_tol = 1e-5)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 1.475, tol = 1e-3)
  expect_equal(res$g2n, 2.525, tol = 1e-3)
  expect_equal(res$par, c(-0.211, 0.054), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "ls", grad_tol = 1e-5)
  expect_equal(res$nf, 21)
  expect_equal(res$ng, 21)
  expect_equal(res$f, 1.828, tol = 1e-3)
  expect_equal(res$g2n, 3.666, tol = 1e-3)
  expect_equal(res$par, c(-0.351, 0.118), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "hz", grad_tol = 1e-5)
  expect_equal(res$nf, 19)
  expect_equal(res$ng, 19)
  expect_equal(res$f, 2.377, tol = 1e-3)
  expect_equal(res$g2n, 14.363, tol = 1e-3)
  expect_equal(res$par, c(-0.413, 0.232), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "hz+", grad_tol = 1e-5)
  expect_equal(res$nf, 19)
  expect_equal(res$ng, 19)
  expect_equal(res$f, 2.487, tol = 1e-3)
  expect_equal(res$g2n, 16.750, tol = 1e-3)
  expect_equal(res$par, c(-0.407, 0.237), tol = 1e-3)

  res <- mize(rb0, rosenbrock_fg, method = "cg", max_iter = 5,
              cg_update = "prfr", grad_tol = 1e-5)
  expect_equal(res$nf, 19)
  expect_equal(res$ng, 19)
  expect_equal(res$f, 2.454, tol = 1e-3)
  expect_equal(res$g2n, 4.351, tol = 1e-3)
  expect_equal(res$par, c(-0.553, 0.326), tol = 1e-3)
})

# Benchmark against minfunc
test_that("CG with strong line search", {
  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "fr", c1 = 1e-10, c2 = 1e-9,
              store_progress = TRUE)
  expect_equal(res$nf, 24)
  expect_equal(res$ng, 24)
  expect_equal(res$f, 0.283, tol = 1e-3)
  expect_equal(res$par, c(0.583, 0.306), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 9.72775e-03, 5.16960e-03, 4.74361e-03),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 6.23690e-01, 4.72437e-01, 2.83017e-01),
               tol = 1e-5)

  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "pr", c1 = 1e-10, c2 = 1e-9,
              store_progress = TRUE)
  expect_equal(res$nf, 25)
  expect_equal(res$ng, 25)
  expect_equal(res$f, 0.317, tol = 1e-3)
  expect_equal(res$par, c(0.461, 0.196), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 9.72775e-03, 7.00902e-03, 1.94442e-02),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 6.23690e-01, 4.36448e-01, 3.17284e-01),
               tol = 1e-5)

  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "hs", c1 = 1e-10, c2 = 1e-9,
              store_progress = TRUE)
  expect_equal(res$nf, 25)
  expect_equal(res$ng, 25)
  expect_equal(res$f, 0.317, tol = 1e-3)
  expect_equal(res$par, c(0.461, 0.196), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 9.72775e-03, 7.00902e-03, 1.94442e-02),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 6.23690e-01, 4.36448e-01, 3.17284e-01),
               tol = 1e-5)

  # after modification of "gilbert-nocedal" update to use the usual FR/PR
  # formulae
  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "prfr", c1 = 1e-10, c2 = 1e-9,
              store_progress = TRUE)
  expect_equal(res$nf, 23)
  expect_equal(res$ng, 23)
  expect_equal(res$f, 0.406, tol = 1e-3)
  expect_equal(res$par, c(0.369, 0.127), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 9.72775e-03, 7.00902e-03, 6.68088e-03),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 6.23690e-01, 4.36448e-01, 4.06045e-01),
               tol = 1e-5)
})

test_that("CG with preconditioning", {
  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "fr", c1 = 1e-10, c2 = 1e-9,
              preconditioner = "l-bfgs", store_progress = TRUE)
  expect_equal(res$nf, 22)
  expect_equal(res$ng, 22)
  expect_equal(res$f, 0.769, tol = 1e-3)
  expect_equal(res$par, c(0.182, 0.00150), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 8.51466e-03, 5.03384e-03, 4.90653e-03),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 7.69892e-01, 7.69442e-01, 7.68989e-01),
               tol = 1e-5)

  res <- mize(c(0, 0), rosenbrock_fg, method = "cg", max_iter = 4,
              cg_update = "pr", c1 = 1e-10, c2 = 1e-9,
              preconditioner = "l-bfgs", store_progress = TRUE)
  expect_equal(res$nf, 25)
  expect_equal(res$ng, 25)
  expect_equal(res$f, 0.317, tol = 1e-3)
  expect_equal(res$par, c(0.461, 0.196), tol = 1e-3)

  expect_equal(res$progress$alpha,
               c(0, 8.06310e-02, 9.36549e-01, 6.74800e-01, 7.87824e-01),
               tol = 1e-5)
  expect_equal(res$progress$f,
               c(1, 7.71110e-01, 6.23690e-01, 4.36448e-01, 3.17284e-01),
               tol = 1e-5)
})
