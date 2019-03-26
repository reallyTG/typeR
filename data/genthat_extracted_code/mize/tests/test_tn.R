context("Truncated Newton")

# Numbers from Octave minfunc with settings:
# options.c1 = 1e-10, options.c2 = 1e-9, options.Method = 'newton0'
# options.maxFunEvals = 31
res <- mize(c(0 ,0), rosenbrock_fg, method = "TN", c1 = 1e-10, c2 = 1e-9,
            store_progress = TRUE, max_fn = 27, try_newton_step = FALSE)

expect_equal(res$nf, 27)
expect_equal(res$ng, 34)
expect_equal(res$f, 0.35, tol = 1e-3)
expect_equal(res$par, c(0.4446, 0.1772), tol = 1e-3)

expect_equal(res$progress$alpha,
             c(0, 1.61262e-01, 1.00000e+00, 1.79967e-01, 1.00453e+00,
               2.73325e-01),
             tol = 1e-5)
expect_equal(res$progress$f,
             c(1, 7.71110e-01, 7.03481e-01, 5.24969e-01, 4.81177e-01,
               3.50106e-01),
             tol = 1e-5)

res <- mize(c(0 ,0), rosenbrock_fg, method = "TN", c1 = 1e-10, c2 = 1e-9,
            store_progress = TRUE, max_fn = 30, preconditioner = "L-BFGS")

expect_equal(res$nf, 30)
expect_equal(res$ng, 38)
expect_equal(res$f, 0.136, tol = 1e-3)
expect_equal(res$par, c(0.680, 0.444), tol = 1e-3)

expect_equal(res$progress$alpha,
             c(0, 1.61262e-01, 1.52249e+00, 1.00440e+00, 1.58637e-01,
               1.56767e+00),
             tol = 1e-5)
expect_equal(res$progress$f,
             c(1, 7.71110e-01, 4.83501e-01, 3.92254e-01, 2.70259e-01,
               1.36470e-01),
             tol = 1e-5)


res <- mize(c(0 ,0), rosenbrock_fg, method = "TN", c1 = 1e-4, c2 = 0.1,
            store_progress = TRUE, max_iter = 5, tn_init = "prev")
expect_equal(res$nf, 21)
expect_equal(res$ng, 31)
expect_equal(res$f, 0.0134, tol = 1e-4)
expect_equal(res$par, c(0.919, 0.836), tol = 1e-3)
expect_equal(res$progress$alpha,
             c(0, 0.1585, 1.385, 2.048, 2.323, 1.718),
             tol = 1e-3)
expect_equal(res$progress$f,
             c(1, 0.771, 0.497, 0.226, 0.0603, 0.0134), tol = 1e-3)

res <- mize(c(0 ,0), rosenbrock_fg, method = "TN", c1 = 1e-4, c2 = 0.1,
            store_progress = TRUE, max_iter = 5, tn_init = 0, tn_exit = "strong")
expect_equal(res$nf, 15)
expect_equal(res$ng, 22)
expect_equal(res$f, 0.352, tol = 1e-3)
expect_equal(res$par, c(0.444, 0.177), tol = 1e-3)
expect_equal(res$progress$alpha,
             c(0, 0.1585, 1.000, 0.175, 1.000, 0.279),
             tol = 1e-3)
expect_equal(res$progress$f,
             c(1, 0.771, 0.707, 0.528, 0.483, 0.352), tol = 1e-3)
