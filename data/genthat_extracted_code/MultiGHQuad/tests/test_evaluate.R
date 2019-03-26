library(MultiGHQuad)
context("Expectation is evaluated correctly")

pos.def <- function(n, ev = runif(n, 0, 10)) 
{
  if (n == 1) return(matrix(runif(1)))
  Z <- matrix(ncol = n, rnorm(n^2))
  decomp <- qr(Z)
  Q <- qr.Q(decomp) 
  R <- qr.R(decomp)
  d <- diag(R)
  ph <- d / abs(d)
  O <- Q %*% diag(ph)
  Z <- t(O) %*% diag(ev) %*% O
  return(Z)
}

for (q in 1:3) for (mu in list(rep(0,q), seq(-3,3,length.out = q))) for (Sigma in list(diag(q), pos.def(q))) {
  qp <- init.quad(q, prior = list(mu = mu, Sigma = Sigma), ip = 20)
  est <- eval.quad(X = qp)
  var <- attr(est, 'variance')
  attr(est, 'variance') <- NULL

  # should be mean
  test_that("Normal expectation", {
    expect_equal(est, mu, tolerance = 1E-5)
  })
  
  # variance should be prior
  test_that("Variance", {
    expect_equivalent(var, Sigma)
  })
  
  # X^2
  est <- eval.quad(dmvnorm, qp, mean = mu, sigma = Sigma, log = TRUE)
  var <- attr(est, "variance")
  attr(est, "variance") <- NULL

  # should be mean
  test_that("Normal expectation", {
    expect_equal(est, mu, tolerance = 1E-5)
  })
}
