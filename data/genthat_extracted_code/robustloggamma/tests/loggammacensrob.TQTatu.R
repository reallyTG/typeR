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
  set.seed(2345)
  TWQ <- robustloggamma:::loggammacensrob.TQTau(x=y,delta=delta,control=loggammarob.control())
  dput(TWQ, file='TQTau-savedvalues.R')  
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
  set.seed(2345)
  TWQTest <- robustloggamma:::loggammacensrob.TQTau(x=y,delta=delta,control=loggammarob.control())
  TWQ <- dget(file='TQTau-savedvalues.R')
  stopifnot(
    all.equal(TWQTest, TWQ, tol = 2e-6)
  )
}
