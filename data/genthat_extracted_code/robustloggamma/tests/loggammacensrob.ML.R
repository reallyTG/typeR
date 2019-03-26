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
  ML <- loggammacensrob(x=y, delta=delta, w=w, method="ML")
  ML$call <- NULL
  dput(ML, file='MLcens-savedvalues.R')
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
  MLTest <- loggammacensrob(x=y, delta=delta, w=w, method="ML")
  MLTest$call <- NULL  
  ML <- dget(file='MLcens-savedvalues.R')  
  stopifnot(
    all.equal(MLTest, ML, tol = 2e-6)
  )
}
