# maximum absolute and relative difference between arrays
max.diff <- function(x1, x2) {
  c(abs = max(abs(x1-x2)), rel = max(abs(x1-x2)/max(abs(x1), 1e-8)))
}



#--- R versions of xmvn, zmvn, lmvn --------------------------------------------

xmvn <- function(z, mean, cholsd) {
  n <- length(z)
  cholsd <- matrix(cholsd, n, n)
  c(mean + z %*% cholsd)
}

zmvn <- function(x, mean, cholsd) {
  n <- length(mean)
  cholsd <- matrix(cholsd, n, n)
  backsolve(r = cholsd, x = x - mean, transpose = TRUE)
}

lmvn <- function(x, mean, cholsd) {
  n <- length(mean)
  cholsd <- matrix(cholsd, n, n)
  z <- backsolve(r = cholsd, x = x - mean, transpose = TRUE)
  -.5 * sum(z^2) - sum(log(diag(cholsd)))
}

rmvn <- function(mean, cholsd) {
  n <- length(mean)
  cholsd <- matrix(cholsd, n, n)
  xmvn(rnorm(n), mean, cholsd)
}

# R likelihood
loglik.fun <- function(x, theta, dt, dr, df) {
  ncomp <- nrow(x)
  mu <- x[-ncomp,,drop=FALSE] + dr(x[-ncomp,], theta) * dt
  cholsd <- df(x[-ncomp,,drop=FALSE], theta) * sqrt(dt)
  sum(sapply(2:ncomp-1, function(ii) {
    lmvn(x[ii+1,], mu[ii,], cholsd[ii,])
  }))
}

# R simulation
sim.fun <- function(nobs, dt, rr, x0, theta, dr, df, validx) {
  X <- matrix(NA, nobs, length(x0))
  x <- x0
  for(ii in 1:nobs) {
    for(jj in 1:rr) {
      mu <- x + dr(x, theta) * (dt/rr)
      csd <- df(x, theta) * sqrt(dt/rr)
      x <- rmvn(mu, csd)
      while(!validx(x, theta)) x <- rmvn(mu, csd)
    }
    X[ii,] <- x
  }
  X
}

#--- initialize single/multiple inputs -----------------------------------------

input.init <- function(nreps, sx, st, randx, randt) {
  has.ncomp <- length(nreps) > 1
  if(!has.ncomp) {
    ncomp <- 1
  } else {
    ncomp <- nreps[1]
    nreps <- nreps[2]
  }
  X <- randx(nreps*ncomp)
  Theta <- randt(nreps)
  if(nreps == 1) {
    Theta <- t(Theta)
  }
  if(nreps*ncomp == 1) {
    X <- t(X)
  }
  if(sx) {
    if(has.ncomp) {
      X <- X[1:ncomp,]
      X.R <- array(X, dim = c(ncomp, ncol(X), nreps))
    } else {
      X.R <- X[rep(1,nreps),,drop=FALSE]
      X <- X[1,]
    }
  } else {
    if(has.ncomp) {
      X <- array(X, dim = c(ncomp, nreps, ncol(X)))
      X <- aperm(X, c(1, 3, 2))
    }
    X.R <- X
  }
  if(st) {
    Theta.R <- Theta[rep(1,nreps),,drop=FALSE]
    Theta <- Theta[1,]
  } else Theta.R <- Theta
  list(X = X, X.R = X.R, Theta = Theta, Theta.R = Theta.R)
}
