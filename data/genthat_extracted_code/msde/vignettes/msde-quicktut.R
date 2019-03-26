## ---- eval = FALSE-------------------------------------------------------
#  sde.drift <- function(x, theta) {
#    dr <- c(theta[1]*x[1] - theta[2]*x[1]*x[2], # alpha * H - beta * H*L
#        theta[2]*x[1]*x[2] - theta[3]*x[2]) # beta * H*L - gamma * L
#    dr
#  }

## ---- eval = FALSE-------------------------------------------------------
#  sde.diff <- function(x, theta) {
#    df <- matrix(NA, 2, 2)
#    df[1,1] <- theta[1]*x[1] + theta[2]*x[1]*x[2] # alpha * H + beta * H*L
#    df[1,2] <- -theta[2]*x[1]*x[2] # -beta * H*L
#    df[2,1] <- df[1,2] # -beta * H*L
#    df[2,2] <- theta[2]*x[1]*x[2] + theta[3]*x[2] # beta * H*L + gamma * L
#    df
#  }

## ------------------------------------------------------------------------
require(msde)

# put lotvolModel.h in the working directory
data.names <- c("H", "L")
param.names <- c("alpha", "beta", "gamma")
lvmod <- sde.make.model(ModelFile = "lotvolModel.h",
                        data.names = data.names,
                        param.names = param.names)

## ------------------------------------------------------------------------
# helper functions

# random matrix of size nreps x length(x) from vector x
jit.vec <- function(x, nreps) {
  apply(t(replicate(n = nreps, expr = x, simplify = "matrix")), 2, jitter)
}
# maximum absolute and relative error between two arrays
max.diff <- function(x1, x2) {
  c(abs = max(abs(x1-x2)), rel = max(abs(x1-x2)/max(abs(x1), 1e-8)))
}

# R sde functions

# drift and diffusion
lv.drift <- function(x, theta) {
  dr <- c(theta[1]*x[1] - theta[2]*x[1]*x[2], # alpha * H - beta * H*L
          theta[2]*x[1]*x[2] - theta[3]*x[2]) # beta * H*L - gamma * L
  dr
}
lv.diff <- function(x, theta) {
  df <- matrix(NA, 2, 2)
  df[1,1] <- theta[1]*x[1] + theta[2]*x[1]*x[2] # alpha * H + beta * H*L
  df[1,2] <- -theta[2]*x[1]*x[2] # -beta * H*L
  df[2,1] <- df[1,2] # -beta * H*L
  df[2,2] <- theta[2]*x[1]*x[2] + theta[3]*x[2] # beta * H*L + gamma * L
  chol(df) # always use sd scale in R
}

# validators
lv.valid.data <- function(x, theta) all(x > 0)
lv.valid.params <- function(theta) all(theta > 0)

# generate some test values
nreps <- 12
x0 <- c(H = 71, L = 79)
theta0 <- c(alpha = .5, beta = .0025, gamma = .3)
X <- jit.vec(x0, nreps)
Theta <- jit.vec(theta0, nreps)

# drift and diffusion check

# R versions
dr.R <- matrix(NA, nreps, lvmod$ndims) # drift
df.R <- matrix(NA, nreps, lvmod$ndims^2) # diffusion
for(ii in 1:nreps) {
  dr.R[ii,] <- lv.drift(x = X[ii,], theta = Theta[ii,])
  # flattens diffusion matrix into a row
  df.R[ii,] <- c(lv.diff(x = X[ii,], theta = Theta[ii,]))
}

# C++ versions
dr.cpp <- sde.drift(model = lvmod, x = X, theta = Theta)
df.cpp <- sde.diff(model = lvmod, x = X, theta = Theta)

# compare
max.diff(dr.R, dr.cpp)
max.diff(df.R, df.cpp)

# validator check

# generate invalid data and parameters
X.bad <- X
X.bad[c(1,3,5),1] <- -X.bad[c(1,3,5),1]
Theta.bad <- Theta
Theta.bad[c(2,4,6),3] <- -Theta.bad[c(2,4,6),3]

# R versions
x.R <- rep(NA, nreps)
theta.R <- rep(NA, nreps)
for(ii in 1:nreps) {
  x.R[ii] <- lv.valid.data(x = X.bad[ii,], theta = Theta.bad[ii,])
  theta.R[ii] <- lv.valid.params(theta = Theta.bad[ii,])
}

# C++ versions
x.cpp <- sde.valid.data(model = lvmod, x = X.bad, theta = Theta.bad)
theta.cpp <- sde.valid.params(model = lvmod, theta = Theta.bad)

# compare
c(x = all(x.R == x.cpp), theta = all(theta.R == theta.cpp))


## ---- fig.width = 10, fig.height = 5, out.width = "90%"------------------

# simulation parameters
theta0 <- c(alpha = .5, beta = .0025, gamma = .3) # true parameter values
x0 <- c(H = 71, L = 79) # initial SDE values
N <- 50 # number of observations
dT <- 1 # time between observations (years)

# simulate data
lvsim <- sde.sim(model = lvmod, x0 = x0, theta = theta0,
                 nobs = N-1, # N-1 steps forward
                 dt = dT,
                 dt.sim = dT/100) # internal observation time

# plot data
Xobs <- rbind(c(x0), lvsim$data) # include first observation
tseq <- (1:N-1)*dT # observation times
clrs <- c("black", "red")
par(mar = c(4, 4, 1, 0)+.1)
plot(x = 0, type = "n", xlim = range(tseq), ylim = range(Xobs),
     xlab = "Time (years)", ylab = "Population")
lines(tseq, Xobs[,"H"], type = "o", pch = 16, col = clrs[1])
lines(tseq, Xobs[,"L"], type = "o", pch = 16, col = clrs[2])
legend("topleft", legend = c("Hare", "Lynx"), fill = clrs)

## ---- fig.width = 10, fig.height = 4, out.width = "90%"------------------
# initialize the posterior sampler
init <- sde.init(model = lvmod, x = Xobs, dt = dT,
                 m = 1, theta = c(.1, .1, .1))

nsamples <- 2e4
burn <- 2e3
lvpost <- sde.post(model = lvmod, init = init,
                   hyper = NULL, #prior specification
                   nsamples = nsamples, burn = burn)

# posterior histograms
tnames <- expression(alpha, beta, gamma)
par(mfrow = c(1,3))
for(ii in 1:lvmod$nparams) {
  hist(lvpost$params[,ii], breaks = 25, freq = FALSE,
       xlab = tnames[ii],
       main = parse(text = paste0("p[1](", tnames[ii], "*\" | \"*bold(Y))")))
  # superimpose true parameter value
  abline(v = theta0[ii], lwd = 4, lty = 2)
}

## ---- eval = FALSE-------------------------------------------------------
#  # 3 missing data points between each observation, so dt_m = dt/4
#  m <- 4
#  init <- sde.init(model = lvmod, x = Xobs, dt = dT,
#                   m = m, theta = c(.1, .1, .1))

## ---- eval = FALSE-------------------------------------------------------
#  init <- sde.init(model = lvmod, x = Xobs, dt = dT,
#                   nvar.obs = 1, # number of "observed" variables per timepoint
#                   m = m, theta = c(.1, .1, .1))

## ---- fig.width = 10, fig.height = 4, out.width = "90%"------------------
# prior specification
pnames <- c("L", "alpha", "gamma")
hyper <- list(mu = rep(1, 3), Sigma = diag(3))
names(hyper$mu) <- pnames
dimnames(hyper$Sigma) <- list(pnames, pnames)

# initialize the posterior sampler
init <- sde.init(model = lvmod, x = Xobs, dt = dT,
                 m = 1, nvar.obs = 1, # L is latent
                 theta = c(.1, .1, .1))

nsamples <- 2e4
burn <- 2e3
lvpost <- sde.post(model = lvmod, init = init,
                   hyper = hyper, #prior specification
                   nsamples = nsamples, burn = burn)

# posterior histograms
tnames <- expression(alpha, beta, gamma)
par(mfrow = c(1,3))
for(ii in 1:lvmod$nparams) {
  hist(lvpost$params[,ii], breaks = 25, freq = FALSE,
       xlab = tnames[ii],
       main = parse(text = paste0("p[1](", tnames[ii], "*\" | \"*bold(Y))")))
  # superimpose true parameter value
  abline(v = theta0[ii], lwd = 4, lty = 2)
}

## ---- eval = FALSE-------------------------------------------------------
#  hyper <- list(mu = c(0,0,0,0), sigma = c(1,1,1,1))

## ---- eval = FALSE-------------------------------------------------------
#  bad.hyper <- list(mean = c(0,0,0,0))

## ------------------------------------------------------------------------
# must match argument signature _exactly_
lvcheck <- function(hyper, param.names, data.names) {
  if(is.null(names(hyper)) ||
     !identical(sort(names(hyper)), c("mu", "sigma"))) {
    stop("hyper must be a list with elements mu and sigma.")
  }
  mu <- hyper$mu
  if(length(mu) == 1) mu <- rep(mu, 4)
  if(!is.numeric(mu) || length(mu) != 4) {
    stop("mu must be a numeric scalar or vector of length four.")
  }
  sig <- hyper$sigma
  if(length(sig) == 1) sig <- rep(sig, 4)
  if(!is.numeric(sig) || length(sig) != 4 || !all(sig > 0)) {
    stop("sigma must be a positive scalar or vector of length four.")
  }
  list(mu, sig)
}
#lvcheck <- mvn.hyper.check

## ------------------------------------------------------------------------
data.names <- c("H", "L")
param.names <- c("alpha", "beta", "gamma")
lvmod2 <- sde.make.model(ModelFile = "lotvolModel.h",
                        PriorFile = "lotvolPrior.h", # prior specification
                        hyper.check = lvcheck, # prior input checking
                        data.names = data.names,
                        param.names = param.names)

## ------------------------------------------------------------------------
# generate some test values
nreta <- 12
x0 <- c(H = 71, L = 79)
theta0 <- c(alpha = .5, beta = .0025, gamma = .3)
X <- jit.vec(x0, nreta)
Theta <- jit.vec(theta0, nreta)
Eta <- cbind(Theta, L = X[,"L"])
nrphi <- 5
Phi <- lapply(1:nrphi, function(ii) list(mu = rnorm(4), sigma = rexp(4)))

# prior check

# R version
lpi.R <- matrix(NA, nreta, nrphi)
for(ii in 1:nrphi) {
  lpi.R[,ii] <- colSums(dlnorm(x =  t(Eta),
                               meanlog = Phi[[ii]]$mu,
                               sdlog = Phi[[ii]]$sigma, log = TRUE))
}

# C++ version
lpi.cpp <- matrix(NA, nreta, nrphi)
for(ii in 1:nrphi) {
  lpi.cpp[,ii] <- sde.prior(model = lvmod2, theta = Theta, x = X,
                            hyper = Phi[[ii]])
}

# compare
max.diff(lpi.R, lpi.cpp)


## ---- eval = FALSE-------------------------------------------------------
#  Rcpp::cppFunction("double AddTest(double x, double y) {return x + y;}")
#  AddTest(5.2, 3.4)

