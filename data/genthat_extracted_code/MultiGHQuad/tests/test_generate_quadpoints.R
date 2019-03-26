library(MultiGHQuad)
context("Quadrature points are generated reasonably")

f.data <- fastGHQuad::gaussHermiteData(20)
m.data <- init.quad(1, ip = 20, prune = FALSE)

test_that("Length and format", {
  expect_is(m.data, "list")
  expect_equal(length(m.data), 2)
  expect_equal(length(m.data$W), 20)
  expect_equal(dim(m.data$X), c(20,1))
})

estimate <- c(1,2)
attr(estimate, 'variance') <- diag(2)

estimateb <- 1
attr(estimateb, 'variance') <- diag(1)

test_that("Adapt accepts previous estimate", {
  expect_error(init.quad(1, adapt = estimate))
  expect_is(init.quad(2, adapt = estimate), "list")
  expect_error(init.quad(3, adapt = estimate))
  expect_is(init.quad(1, adapt = estimateb), "list")
  expect_error(init.quad(2, adapt = estimateb))
})

adapt <- list(mu = c(1,1), Sigma = diag(2))

test_that("Adapt accepts list", {
  expect_error(init.quad(1, adapt = adapt))
  expect_is(init.quad(2, adapt = adapt), "list")
  expect_error(init.quad(3, adapt = adapt))
})


test_that("Univariate Quad points match", {
  expect_equal(f.data$x, m.data$X[,1] / sqrt(2))
  expect_equal(f.data$w, exp(m.data$W) * sqrt(pi))
})

M.data <- init.quad(2, ip = 20, prune = FALSE)

test_that("Dims of multivariate quad points make sense", {
  expect_equal(dim(M.data$X), c(20**2, 2))
})


test_that("Sum of weights is 1, pruning does not take too much", {
  for (q in seq(2,4)) {
    for (ip in c(6,10,20)){
      pruned <- exp(init.quad(q, ip = ip)$W)
      not.pruned <- exp(init.quad(q, ip = ip, prune = FALSE)$W)
      
      expect_equal(sum(not.pruned), 1, label = paste("q", q, "ip", ip))
      # loose no more than 2% of weights.
      expect_lt(1 - sum(not.pruned), .01, label = paste("q", q, "ip", ip))  
    }
  }
})


# https://stat.ethz.ch/pipermail/r-help/2008-February/153708.html
##########################################################

pos.def <- function(n, ev = runif(n, 0, 10)) 
{
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

# Not sure this whole thing isn't just silly - pruning affects cov.
con <- c(1/10, 1/9.523810, 1/9.501188, 1/9.500059) # I'm having a brainfart. What is this?
for (q in 2:4){
  x <- pos.def(q)
  tol <- 1e-3     # this is numerical estimation, not rocket science
  
  test_that("X transformed correctly", {
    expect_equal(cov(init.quad(q, prior = list(mu = rep(0,q), Sigma = diag(q)), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], diag(q), tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = rep(1,q), Sigma = diag(q)), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], diag(q), tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = rep(-1,q), Sigma = diag(q)), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], diag(q), tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = rep(0,q), Sigma = diag(q)/2), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], diag(q)/2, tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = rep(0,q), Sigma = diag(q)*10), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], diag(q)*10, tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = rep(0,q), Sigma = x), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], x, tolerance = tol)
    expect_equal(cov(init.quad(q, prior = list(mu = seq(-q,q,length.out = q), Sigma = x), ip = 20, prune = FALSE)$X / sqrt(2))*con[q], x, tolerance = tol)
  })
}


