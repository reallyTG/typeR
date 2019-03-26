# library(testthat)

acf2incr.SGtest <- function(gam) {
  N <- length(gam)-1
  if(N == 1) {
    igam <- 2*(gam[1]-gam[2])
  } else {
    igam <- 2*gam[1:N] - gam[1:N+1] - gam[c(2, 1:(N-1))]
  }
  igam
}

fbm.acf.SGtest <- function(alpha, dT, N) {
  if(N == 1) {
    acf <- dT^alpha
  } else {
    acf <- (dT*(0:N))^alpha
    acf <- .5 * (acf[1:N+1] + c(acf[2], acf[1:(N-1)]) - 2*acf[1:N])
  }
  acf
}

exp2.acf.SGtest <- function(lambda, dT, N, incr) {
  # process autocorrelation
  gam <- exp(-(0:N*dT/lambda)^2)
  if(incr) {
    # increments
    ans <- acf2incr.SGtest(gam)
  } else {
    # observations
    ans <- gam[1:N]
  }
  ans
}

exp.acf.SGtest <- function(lambda, dT, N, incr) {
  # process autocorrelation
  gam <- exp(-(0:N*dT/lambda))
  if(incr) {
    # increments
    ans <- acf2incr.SGtest(gam)
  } else {
    # observations
    ans <- gam[1:N]
  }
  ans
}

matern.acf.SGtest <- function(lambda, nu, dT, N, incr) {
  # process autocorrelation
  tt <- sqrt(2*nu) * (0:N)*dT/lambda
  gam <- nu * log(.5 * tt) - lgamma(nu)
  gam <- 2 * exp(gam) * besselK(tt, nu)
  gam[tt == 0] <- 1
  if(incr) {
    # increments
    ans <- acf2incr.SGtest(gam)
  } else {
    # observations
    ans <- gam[1:N]
  }
  ans
}

acf.get.SGtest <- function(N, type, dT, incr = TRUE){
  lambda <- 3.3
  H <- 0.4
  nu <- 3
  if(type == "exp2"){
    acf <- exp2.acf.SGtest(lambda, dT, N, incr)
  }
  if(type == "exp"){
    acf <- exp.acf.SGtest(lambda, dT, N, incr)
  }
  if(type == "fbm"){
    acf <- fbm.acf.SGtest(H, dT, N)
  }else{
    acf <- matern.acf.SGtest(lambda, nu, dT, N, incr)
  }
  acf
}

trace.SGtest <- function(mat) sum(diag(as.matrix(mat)))

fbm.acf.grad.SGtest <- function(alpha, dT, N) {
  if(N == 1) {
    dacf <- dT^alpha * log(alpha)
  } else {
    dacf <- c(0, (dT*(1:N))^alpha * log(dT*(1:N)))
    dacf <- .5 * (dacf[1:N+1] + c(dacf[2], dacf[1:(N-1)]) - 2*dacf[1:N])
  }
  dacf
}

fbm.acf.hess.SGtest <- function(alpha, dT, N) {
  if(N == 1) {
    d2acf <- dT^alpha * log(alpha)^2
  } else {
    d2acf <- c(0, (dT*(1:N))^alpha * log(dT*(1:N))^2)
    d2acf <- .5 * (d2acf[1:N+1] + c(d2acf[2], d2acf[1:(N-1)]) - 2*d2acf[1:N])
  }
  d2acf
}


fbm.mu.SGtest <- function(mu, N){
  rep(mu^2, N)
}

fbm.mu.grad.SGtest <- function(mu, N){
  rep(2 * mu, N)
}

fbm.mu.hess.SGtest <- function(mu, N){
  rep(2, N)
}

test.grad.hess.SGtest <- function(Theta, X, acf, dT){
  N <- nrow(X)
  theta <- Theta[1]
  alpha <- Theta[2]
  mu <- fbm.mu.SGtest(theta, N)
  acf1 <- fbm.acf.SGtest(alpha, dT, N)
  acf$setAcf(acf1)
  dnsy <- dSnorm(X = X, mu = mu, acf = acf)
  dnsy
}
