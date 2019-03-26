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
  WLoneemp <- loggammacensrob(x=y, delta=delta, method="oneWL")
  WLoneemp$call <- NULL
##  WLoneexp <- loggammacensrob(x=y, delta=delta, method="oneWL",
##    control=loggammarob.control(expJ=TRUE))  
##  WLoneexp$call <- NULL
  dput(WLoneemp, file='oneWLemp-savedvalues.R')
##  dput(WLoneexp, file='oneWLexp-savedvalues.R')  
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
  WLoneempTest <- loggammacensrob(x=y, delta=delta, method="oneWL")
  WLoneempTest$call <- NULL
##  WLoneexpTest <- loggammacensrob.oneWL(x=y, delta=delta, method="oneWL", control=loggammarob.control(expJ=TRUE))
##  WLoneexpTest$call <- NULL
  WLoneemp <- dget(file='oneWLemp-savedvalues.R')
##  WLoneexp <- dget(file='oneWLexp-savedvalues.R')  
  stopifnot(
    all.equal(WLoneempTest, WLoneemp, tol = 2e-6)
  )
  ## stopifnot(  
  ##   all.equal(WLoneexpTest, WLoneexp, tol = 2e-6)      
  ## )
}
