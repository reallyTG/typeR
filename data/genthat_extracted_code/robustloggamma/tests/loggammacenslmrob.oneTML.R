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
  TMLoneemp <- loggammacenslmrob(y~X, delta=delta, method="oneTML")
  TMLoneemp$call <- NULL
  dput(TMLoneemp, file='oneTMLregemp-savedvalues.R')
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
  TMLoneempTest <- loggammacenslmrob(y~X, delta=delta, method="oneTML")
  TMLoneempTest$call <- NULL
  TMLoneemp <- dget(file='oneTMLregemp-savedvalues.R')
  stopifnot(
    all.equal(TMLoneempTest, TMLoneemp, tol = 2e-6)
  )
}
