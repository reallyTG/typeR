context("Solve Quadratic Positive Definite")

test_that("can solve Ax = b", {

# http://papers.nips.cc/paper/5322-a-differential-equation-for-modeling-nesterovs-accelerated-gradient-method-theory-and-insights.pdf
# A is a 500×500 random
# positive definite matrix and b a random vector.
# The eigenvalues of A are between 0.001 and 1.
# The vector b is generated as i. i. d. Gaussian random variables with mean 0 and variance 25.

posdef_quad_fg <- function(n = 500, min_eig = 0.001, max_eig = 1,
                           bmean = 0, bvar = 25) {
  b <- stats::rnorm(n = n, mean = bmean, sd = sqrt(bvar))
  A <- rposdef(n = n, ev = stats::runif(n = n, min = min_eig, max = max_eig))
  quad_matrix_fg(A, b)
}

# Generating a random positive-definite matrix with user-specified positive
# eigenvalues
# If eigenvalues are not specified, they are generated from a uniform
# distribution
# From https://stat.ethz.ch/pipermail/r-help/2008-February/153708.html
rposdef <- function(n, ev = stats::runif(n, 0, 10)) {
  Z <- matrix(ncol = n, stats::rnorm(n ^ 2))
  decomp <- qr(Z)
  Q <- qr.Q(decomp)
  R <- qr.R(decomp)
  d <- diag(R)
  ph <- d / abs(d)
  O <- Q %*% diag(ph)
  t(O) %*% diag(ev) %*% O
}

# Returns function and gradient for the strongly convex function
# 0.5 xA'x - b't
# gradient is 0.5A'x + 0.5Ax - b
# http://math.stackexchange.com/questions/222894/how-to-take-the-gradient-of-the-quadratic-form
# Strongly convex
quad_matrix_fg <- function(A, b) {
  f <- function(par) {
    drop(0.5 * t(par) %*% A %*% par - t(b) %*% par)
  }
  f0 <- f(solve(A, b))

  res <-
    list(
      fn = function(par) {
        f(par) - f0
      }
      , gr = function(par) {
        as.vector(0.5 * (t(A) %*% par + A %*% par) - b)
      }
      , hs = function(par) {
        A
      },
      A = A,
      b = b,
      f0 = f
    )
  res
}

n <- 250
pd_fg <- posdef_quad_fg(n = n, min_eig = 0.001, max_eig = 1,
                        bmean = 0, bvar = 25)
pd_res <- mize(rep(0, n), fg = pd_fg, max_iter = 1000)
expect_equal(pd_res$par, solve(pd_fg$A, pd_fg$b), tol = 1e-5)
})
