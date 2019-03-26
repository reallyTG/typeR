library(robustloggamma)

do.test <- TRUE
if (!do.test) {
  n <- 200
  p <- 4
  set.seed(1234)
  mu <- 2
  sigma <- 2
  lambda <- 1
  y <- rloggamma(n=n, mu=mu, sigma=sigma, lambda=lambda)
  cens <- rloggamma(n=n, mu=mu+2.5, sigma=sigma, lambda=lambda)
  delta <- as.numeric(y <= cens)
  y[delta==0] <- cens[delta==0]
  w <- rep(1,n)
  set.seed(2345)
  TMLoneemp <- loggammacensrob(x=y, delta=delta, method="oneTML")
  TMLoneemp$call <- NULL
  dput(TMLoneemp, file='oneTMLemp-savedvalues.R')
} else {
  n <- 200
  p <- 4
  set.seed(1234)
  mu <- 2
  sigma <- 2
  lambda <- 1
  y <- rloggamma(n=n, mu=mu, sigma=sigma, lambda=lambda)
  cens <- rloggamma(n=n, mu=mu+2.5, sigma=sigma, lambda=lambda)
  delta <- as.numeric(y <= cens)
  y[delta==0] <- cens[delta==0]
  w <- rep(1,n)
  set.seed(2345)
  TMLoneempTest <- loggammacensrob(x=y, delta=delta, method="oneTML")
  TMLoneempTest$call <- NULL
  TMLoneemp <- dget(file='oneTMLemp-savedvalues.R')
  stopifnot(
    all.equal(TMLoneempTest, TMLoneemp, tol = 2e-6)
  )
}
