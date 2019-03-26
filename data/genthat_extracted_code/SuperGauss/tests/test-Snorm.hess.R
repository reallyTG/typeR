library(SuperGauss)
library(mvtnorm)
library(numDeriv)
source("SuperGauss-test-functions.R")
context("Hessian")

# ok construct a simple example
# acf(t, theta): sigma^2 * exp(t, alpha)
# mu(t, theta) = alpha * t + log(gamma + t)
# theta = (alpha, gamma, sigma)

acf.fun <- function(tseq, theta) {
  theta[3]^2 * exp(-theta[1]*tseq)
}
mu.fun <- function(tseq, theta) {
  theta[1] * tseq + log(theta[2] + tseq)
}
dacf.fun <- function(tseq, theta) {
  jacobian(acf.fun, theta, tseq = tseq)
}
dmu.fun <- function(tseq, theta) {
  jacobian(mu.fun, theta, tseq = tseq)
}
d2acf.fun <- function(tseq, theta) {
  H <- vapply(tseq, function(tt) {
    hessian(function(th) acf.fun(tt, th), theta)
  }, matrix(0, length(theta), length(theta)))
  aperm(H, dim = c(3, 1, 2))
}
d2mu.fun <- function(tseq, theta) {
  H <- vapply(tseq, function(tt) {
    hessian(function(th) mu.fun(tt, th), theta)
  }, matrix(0, length(theta), length(theta)))
  aperm(H, dim = c(3, 1, 2))
}

test_that("Snorm.hess and numerical deriv. of dmvnorm agree", {
  case.par <- expand.grid(N = sample(10:30, 10, replace = TRUE),
                          miss = c("none", "dacf", "dmu", "mu"))
  for(ii in 1:nrow(case.par)) {
    N <- case.par$N[ii]
    miss <- as.character(case.par$miss[ii])
    theta0 <- runif(3, min = .75, max = 1.25)
    dT <- runif(1, min = .75, max = 1.25)
    tseq <- (1:N-1)*dT
    if(miss == "none") {
      loglik.mvn <- function(theta, X, tseq) {
        dmvnorm(x = X, mean = mu.fun(tseq, theta),
                sigma = toeplitz(acf.fun(tseq, theta)), log = TRUE)
      }
      X <- rmvnorm(n = 1, mean = mu.fun(tseq, theta0),
                   sigma = toeplitz(acf.fun(tseq, theta0)))[1,]
      nhess <- hessian(loglik.mvn, theta0, tseq = tseq, X = X)
      ahess <- Snorm.hess(X = X, mu = mu.fun(tseq, theta0),
                          acf = acf.fun(tseq, theta0),
                          dmu = dmu.fun(tseq, theta0),
                          dacf = dacf.fun(tseq, theta0),
                          d2mu = d2mu.fun(tseq, theta0),
                          d2acf = d2acf.fun(tseq, theta0))
    } else if(miss == "dacf") {
      acf <- acf.fun(tseq, theta0)
      loglik.mvn <- function(theta, X, tseq) {
        dmvnorm(x = X, mean = mu.fun(tseq, theta),
                sigma = toeplitz(acf), log = TRUE)
      }
      X <- rmvnorm(n = 1, mean = mu.fun(tseq, theta0),
                   sigma = toeplitz(acf))[1,]
      nhess <- hessian(loglik.mvn, theta0, tseq = tseq, X = X)
      ahess <- Snorm.hess(X = X, mu = mu.fun(tseq, theta0),
                          acf = acf,
                          dmu = dmu.fun(tseq, theta0),
                          d2mu = d2mu.fun(tseq, theta0))
    } else if(miss == "dmu") {
      mu <- mu.fun(tseq, theta0)
      loglik.mvn <- function(theta, X, tseq) {
        dmvnorm(x = X, mean = mu,
                sigma = toeplitz(acf.fun(tseq, theta)), log = TRUE)
      }
      X <- rmvnorm(n = 1, mean = mu,
                   sigma = toeplitz(acf.fun(tseq, theta0)))[1,]
      nhess <- hessian(loglik.mvn, theta0, tseq = tseq, X = X)
      ahess <- Snorm.hess(X = X, mu = mu,
                          acf = acf.fun(tseq, theta0),
                          dacf = dacf.fun(tseq, theta0),
                          d2acf = d2acf.fun(tseq, theta0))
    } else if(miss == "mu") {
      loglik.mvn <- function(theta, X, tseq) {
        dmvnorm(x = X, sigma = toeplitz(acf.fun(tseq, theta)), log = TRUE)
      }
      X <- rmvnorm(n = 1, sigma = toeplitz(acf.fun(tseq, theta0)))[1,]
      nhess <- hessian(loglik.mvn, theta0, tseq = tseq, X = X)
      ahess <- Snorm.hess(X = X,
                          acf = acf.fun(tseq, theta0),
                          dacf = dacf.fun(tseq, theta0),
                          d2acf = d2acf.fun(tseq, theta0))
    }
    expect_equal(nhess, ahess)
  }
})
