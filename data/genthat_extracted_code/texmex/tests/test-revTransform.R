context("revTransform")

test_that("revTransform behaves as it should", {
  skip_on_cran()
  set.seed(20111010)
  n <- 5000
  x <- cbind(rexp(n), rexp(n, 3))

  x.fit <- migpd(x, mqu = 0.5, penalty="none")

  marg.l <- list("laplace",
                 p2q = function(p) ifelse(p<0.5,log(2*p),-log(2*(1-p))),
                 q2p = function(q) ifelse(q<0, exp(q)/2, 1-exp(-q)/2))
  marg.g <- list("gumbel",
                 p2q = function(p) -log(-log(p)),
                 q2p = function(q) exp(-exp(-q)))
  y.l.m <- mexTransform(x.fit, method="mixture", margins=marg.l)$transformed
  y.l.e <- mexTransform(x.fit, method="empirical", margins=marg.l)$transformed

  y.g.m <- mexTransform(x.fit, method="mixture", margins=marg.g)$transformed
  y.g.e <- mexTransform(x.fit, method="empirical", margins=marg.g)$transformed

  u.g.m <- marg.g$q2p(y.g.m)
  u.g.e <- marg.g$q2p(y.g.e)

  u.l.m <- marg.l$q2p(y.l.m)
  u.l.e <- marg.l$q2p(y.l.e)

  x.l.m <- cbind(revTransform(u.l.m[, 1], x[, 1],
                              x.fit$mqu[1], x.fit$mth[1],
                              exp(x.fit$models[[1]]$coefficients[1]),
                              x.fit$models[[1]]$coefficients[2]),
                 revTransform(u.l.m[, 2], x[, 2],
                              x.fit$mqu[2], x.fit$mth[2],
                              exp(x.fit$models[[2]]$coefficients[1]),
                              x.fit$models[[2]]$coefficients[2]))
  x.l.e <- cbind(revTransform(u.l.e[, 1], x[, 1], method="empirical"),
                 revTransform(u.l.e[, 2], x[, 2], method="empirical"))

  x.g.m <- cbind(revTransform(u.g.m[,1], x[, 1],
                              x.fit$mqu[1],x.fit$mth[1],
                              exp(x.fit$models[[1]]$coefficients[1]),
                              x.fit$models[[1]]$coefficients[2]),
                 revTransform(u.g.m[,2], x[, 2],
                              x.fit$mqu[2],x.fit$mth[2],
                              exp(x.fit$models[[2]]$coefficients[1]),
                              x.fit$models[[2]]$coefficients[2]))
  x.g.e <- cbind(revTransform(u.g.e[,1], x[, 1], method="empirical"),
                 revTransform(u.g.e[,2], x[, 2], method="empirical"))

  expect_equal(x.l.e, x, tolerance=0.0001,
               label="revTransform: empirical transformation, laplace target")
  expect_equal(x.l.m, x, tolerance=0.0001,
               label="revTransform: mixture transformation, laplace target")
  expect_equal(x.g.e, x, tolerance=0.0001,
               label="revTransform: empirical transformation, gumbel target")
  expect_equal(x.g.m, x, tolerance=0.0001,
               label="revTransform: mixture transformation, gumbel target")
}
)
