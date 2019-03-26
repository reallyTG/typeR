library(robustloggamma)

do.test <- TRUE
if (!do.test) {
  n <- 200
  p <- 4
  set.seed(1234)
  X <- matrix(rnorm(p*n, sd=2), ncol=p)
  mu <- 2
  beta <- rep(2,p)
  sigma <- 2
  lambda <- 1
  linear <- mu + X%*%beta
  y <- rloggamma(n=n, mu=linear, sigma=sigma, lambda=lambda)
  cens <- rloggamma(n=n, mu=linear+2.5, sigma=sigma, lambda=lambda)
  delta <- as.numeric(y <= cens)
  y[delta==0] <- cens[delta==0]
  w <- rep(1,n)
  set.seed(2345)
  ML <- loggammacenslmrob(y~X, delta=delta, method="ML")
  ML$call <- NULL
  dput(ML, file='MLcensreg-savedvalues.R')
} else {
  n <- 200
  p <- 4
  set.seed(1234)
  X <- matrix(rnorm(p*n, sd=2), ncol=p)
  mu <- 2
  beta <- rep(2,p)
  sigma <- 2
  lambda <- 1
  linear <- mu + X%*%beta
  y <- rloggamma(n=n, mu=linear, sigma=sigma, lambda=lambda)
  cens <- rloggamma(n=n, mu=linear+2.5, sigma=sigma, lambda=lambda)
  delta <- as.numeric(y <= cens)
  y[delta==0] <- cens[delta==0]
  w <- rep(1,n)
  set.seed(2345)
  MLTest <- loggammacenslmrob(y~X, delta=delta, method="ML")
  MLTest$call <- NULL
  ML <- dget(file='MLcensreg-savedvalues.R')
  stopifnot(
    all.equal(MLTest, ML, tol = 2e-6)
  )
}
