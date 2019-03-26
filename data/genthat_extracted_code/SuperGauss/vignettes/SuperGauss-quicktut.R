## ----fbmsim, include = FALSE---------------------------------------------
require(SuperGauss)

N <- 3000 # number of observations
dT <- 1/60 # time between observations (seconds)
H <- .3 # Hurst parameter

tseq <- (0:N)*dT # times at which to sample fBM
npaths <- 5 # number of fBM paths to generate

# to generate fbm, generate its increments, which are stationary
msd <- fbm.msd(tseq = tseq[-1], H = H)
acf <- msd2acf(msd = msd) # convert msd to acf

# superfast method
system.time({
  dX <- rSnorm(n = npaths, acf = acf, fft = TRUE)
})
# fast method (about 3x as slow)
system.time({
  rSnorm(n = npaths, acf = acf, fft = FALSE)
})
# unstructured variance method (much slower)
system.time({
  matrix(rnorm(N*npaths), npaths, N) %*% chol(toeplitz(acf))
})

## ----fbmsim--------------------------------------------------------------
require(SuperGauss)

N <- 3000 # number of observations
dT <- 1/60 # time between observations (seconds)
H <- .3 # Hurst parameter

tseq <- (0:N)*dT # times at which to sample fBM
npaths <- 5 # number of fBM paths to generate

# to generate fbm, generate its increments, which are stationary
msd <- fbm.msd(tseq = tseq[-1], H = H)
acf <- msd2acf(msd = msd) # convert msd to acf

# superfast method
system.time({
  dX <- rSnorm(n = npaths, acf = acf, fft = TRUE)
})
# fast method (about 3x as slow)
system.time({
  rSnorm(n = npaths, acf = acf, fft = FALSE)
})
# unstructured variance method (much slower)
system.time({
  matrix(rnorm(N*npaths), npaths, N) %*% chol(toeplitz(acf))
})

## ---- fig.width = 10, fig.height = 5, out.width = "90%"------------------
# convert increments to position measurements
Xt <- apply(rbind(0, dX), 2, cumsum)

# plot
clrs <- c("black", "red", "blue", "orange", "green2")
par(mar = c(4.1,4.1,.5,.5))
plot(0, type = "n", xlim = range(tseq), ylim = range(Xt),
     xlab = "Time (s)", ylab = "Position (m)")
for(ii in 1:npaths) {
  lines(tseq, Xt[,ii], col = clrs[ii], lwd = 2)
}

## ------------------------------------------------------------------------
# allocate and assign in one step
Toep <- Toeplitz(acf = acf)
Toep

# allocate memory only
Toep <- Toeplitz(n = N)
Toep
Toep$setAcf(acf = acf) # assign later

## ------------------------------------------------------------------------
all(acf == Toep$getAcf()) # extract acf

# matrix multiplication
z <- rnorm(N)
x1 <- toeplitz(acf) %*% z # regular way
x2 <- Toep %*% z # with Toeplitz class
range(x1-x2)

# system of equations
y1 <- solve(toeplitz(acf), z) # regular way
y2 <- solve(Toep, z) # with Toeplitz class
range(y1-y2)

# log-determinant
ld1 <- determinant(toeplitz(acf))$mod
ld2 <- determinant(Toep) # note: no $mod
c(ld1, ld2)

## ------------------------------------------------------------------------
dX <- diff(Xt[,1]) # obtain the increments of a given path
N <- length(dX)

# autocorrelation of fBM increments
fbm.acf <- function(H) {
  msd <- fbm.msd(1:N*dT, H = H)
  msd2acf(msd)
}

# loglikelihood using generalized Schur algorithm
Toep <- Toeplitz(n = N) # pre-allocate memory
loglik.GS <- function(H) {
  Toep$setAcf(acf = fbm.acf(H))
  dSnorm(X = dX, acf = Toep, log = TRUE)
}

# loglikelihood using Durbin-Levinson algorithm
loglik.DL <- function(H) {
  dSnormDL(X = dX, acf = fbm.acf(H), log = TRUE)
}

# superfast method
system.time({
  GS.mle <- optimize(loglik.GS, interval = c(.01, .99), maximum = TRUE)
})
# fast method (about 10x slower)
system.time({
  DL.mle <- optimize(loglik.DL, interval = c(.01, .99), maximum = TRUE)
})
c(GS = GS.mle$max, DL = DL.mle$max)

# standard error calculation
require(numDeriv)
Hmle <- GS.mle$max
Hse <- -hessian(func = loglik.GS, x = Hmle) # observed Fisher Information
Hse <- sqrt(1/Hse[1])
c(mle = Hmle, se = Hse)

## ------------------------------------------------------------------------
T1 <- Toeplitz(n = N)
T2 <- T1 # shallow copy: both of these point to the same memory location

# affects both objects
T1$setAcf(fbm.acf(.5))
T1
T2

loglik <- function(H) {
  T1$setAcf(acf = fbm.acf(H))
  dSnorm(X = dX, acf = T1, log = TRUE)
}

# affects both objects
loglik(H = .3)
T1
T2

## ------------------------------------------------------------------------
# autocorrelation function
exp.acf <- function(t, lambda, sigma) sigma^2 * exp(-abs(t/lambda))
# gradient, returned as a 2-column matrix
exp.acf.grad <- function(t, lambda, sigma) {
  ea <- exp.acf(t, lambda, 1)
  cbind(abs(t)*(sigma/lambda)^2 * ea, # d_acf/d_lambda
        2*sigma * ea) # d_acf/d_sigma
}
# Hessian, returned as an array of size length(t) x 2 x 2
exp.acf.hess <- function(t, lambda, sigma) {
  ea <- exp.acf(t, lambda, 1)
  sl2 <- sigma/lambda^2
  hess <- array(NA, dim = c(length(t), 2, 2))
  hess[,1,1] <- sl2^2*(t^2 - 2*abs(t)*lambda) * ea # d2_acf/d_lambda^2
  hess[,1,2] <- 2*sl2 * abs(t) * ea # d2_acf/(d_lambda d_sigma)
  hess[,2,1] <- hess[,1,2] # d2_acf/(d_sigma d_lambda)
  hess[,2,2] <- 2 * ea # d2_acf/d_sigma^2
  hess
}

# simulate data
lambda <- runif(1, .5, 2)
sigma <- runif(1, .5, 2)
tseq <- (1:N-1)*dT
acf <- exp.acf(t = tseq, lambda = lambda, sigma = sigma)
Xt <- rSnorm(acf = acf)

Toep <- Toeplitz(n = N) # storage space

# negative loglikelihood function of theta = (lambda, sigma)
# include attributes for gradient and Hessian
exp.negloglik <- function(theta) {
  lambda <- theta[1]
  sigma <- theta[2]
  # acf, its gradient, and Hessian
  Toep$setAcf(acf = exp.acf(tseq, lambda, sigma)) # use the Toeplitz class
  dacf <- exp.acf.grad(tseq, lambda, sigma)
  d2acf <- exp.acf.hess(tseq, lambda, sigma)
  nll <- -1 * dSnorm(X = Xt, acf = Toep, log = TRUE)
  attr(nll, "gradient") <- -1 * Snorm.grad(X = Xt, acf = Toep, dacf = dacf)
  attr(nll, "hessian") <- -1 * Snorm.hess(X = Xt, acf = Toep,
                                          dacf = dacf, d2acf = d2acf)
  nll
}

# optimization
system.time({
  mle.fit <- nlm(f = exp.negloglik, p = c(1,1), hessian = TRUE)
})

# display estimates with standard errors
rbind(true = c(lambda = lambda, sigma = sigma),
      est = mle.fit$estimate,
      se = sqrt(diag(solve(mle.fit$hessian))))


