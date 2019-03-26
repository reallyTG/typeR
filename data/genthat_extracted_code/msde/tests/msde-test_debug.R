# script to test generic drift and diffusion functions on cholSD scale.
# calculations are checked against msde C++ code

# inherits: param.names, data.names
# drift.fun, diff.fun
# model (sde.model with default prior)

ndims <- model$ndims
nparams <- model$nparams
abs.tol <- 1e-6 # absolute tolerance
dT.max <- test.params$dT.max # maximum step size
dT.pf <- test.params$dT.pf # maximum step size fr particle filter

source("msde-testfunctions.R")

#--- test drift and diffusion --------------------------------------------------

nreps <- 10
cases <- expand.grid(single.x = c(TRUE, FALSE), single.theta = c(TRUE, FALSE))
ncases <- nrow(cases)

# drift
test_that("drift.R == drift.cpp", {
  mxd <- matrix(NA, ncases, 2)
  for(ii in 1:ncases) {
    sx <- cases$single.x[ii]
    st <- cases$single.theta[ii]
    init <- input.init(nreps, sx, st, randx, randt)
    dr <- sde.drift(model = model, x = init$X, theta = init$Theta)
    dr.R <- drift.fun(x = init$X.R, theta = init$Theta.R)
    if(sx && st) dr.R <- dr.R[1,]
    mxd[ii,] <- max.diff(dr, dr.R)
    expect_equal(mxd[ii,], c(0,0), tolerance = abs.tol)
  }
})

# diffusion
test_that("diff.R == diff.cpp", {
  mxd <- matrix(NA, ncases, 2)
  for(ii in 1:ncases) {
    sx <- cases$single.x[ii]
    st <- cases$single.theta[ii]
    init <- input.init(nreps, sx, st, randx, randt)
    df <- sde.diff(model = model, x = init$X, theta = init$Theta)
    df.R <- diff.fun(x = init$X.R, theta = init$Theta.R)
    if(sx && st) df.R <- df.R[1,]
    mxd[ii,] <- max.diff(df, df.R)
    expect_equal(mxd[ii,], c(0, 0), tolerance = abs.tol)
  }
})

#--- test simulation -----------------------------------------------------------

SEED <- sample(1000, 1)
## nreps <- 10
## nobs <- 8
## burn <- 3
cases <- expand.grid(single.x = c(TRUE, FALSE), single.theta = c(TRUE, FALSE),
                     burn = c(TRUE, FALSE), nreps = c(TRUE, FALSE),
                     rr = c(TRUE, FALSE))
ncases <- nrow(cases)

test_that("sim.R == sim.cpp", {
  mxd <- matrix(NA, ncases, 2)
  for(ii in 1:ncases) {
    sx <- cases$single.x[ii]
    st <- cases$single.theta[ii]
    dT <- runif(1, max = dT.max)
    burn <- ifelse(cases$burn[ii], sample(1:3, 1), 0)
    nreps <- ifelse(cases$nreps[ii], sample(5:10, 1), 1)
    nobs <- sample(5:10, 1)
    rr <- ifelse(cases$rr[ii], sample(2:3,1), 1)
    init <- input.init(nreps, sx, st, randx, randt)
    set.seed(seed = SEED)
    sim <- sde.sim(model = model, x0 = init$X, theta = init$Theta,
                   dt = dT, dt.sim = dT/rr, nobs = nobs,
                   burn = burn, nreps = nreps, verbose = FALSE)$data
    sim.R <- array(NA, dim = c(nobs, ndims, nreps))
    set.seed(seed = SEED)
    for(jj in 1:nreps) {
      sim.R[,,jj] <- sim.fun(nobs = nobs+burn, dt = dT, rr = rr,
                             x0 = init$X.R[jj,],
                             theta = init$Theta.R[jj,],
                             dr = drift.fun, df = diff.fun,
                             validx = validx)[burn+1:nobs,]
    }
    mxd[ii,] <- max.diff(sim, drop(sim.R))
    expect_equal(mxd[ii,], c(0, 0), tolerance = abs.tol)
  }
})

#--- test log-likelihood -------------------------------------------------------

cases <- expand.grid(single.x = c(TRUE, FALSE), single.theta = c(TRUE, FALSE))
ncases <- nrow(cases)

test_that("ll.R == ll.cpp", {
  mxd <- matrix(NA, ncases, 2)
  for(ii in 1:ncases) {
    dT <- runif(1, max = dT.max)
    nobs <- sample(5:20, 1)
    nreps <- sample(10:20, 1)
    sx <- cases$single.x[ii]
    st <- cases$single.theta[ii]
    init <- input.init(nreps = c(nobs, nreps), sx, st, randx, randt)
    ll <- sde.loglik(model = model, x = init$X, theta = init$Theta, dt = dT)
    ll.R <- rep(NA, nreps)
    for(jj in 1:nreps) {
      ll.R[jj] <- loglik.fun(x = init$X.R[,,jj], theta = init$Theta.R[jj,],
                             dt = dT, dr = drift.fun, df = diff.fun)
    }
    if(sx && st) {
      ll.R <- ll.R[1]
    }
    mxd[ii,] <- max.diff(ll, ll.R)
    expect_equal(mxd[ii,], c(0, 0), tolerance = abs.tol)
  }
})

#--- test default prior --------------------------------------------------------

nreps <- 10
cases <- expand.grid(single.x = c(TRUE, FALSE), single.theta = c(TRUE, FALSE),
                     ntheta = 0:nparams, nx = 0:ndims)
ncases <- nrow(cases)

test_that("lpi.R == lpi.cpp", {
  mxd <- matrix(NA, ncases, 2)
  for(ii in 1:ncases) {
    sx <- cases$single.x[ii]
    st <- cases$single.theta[ii]
    init <- input.init(nreps = nreps, sx = sx, st = st, randx ,randt)
    ntheta <- cases$ntheta[ii]
    nx <- cases$nx[ii]
    nrv <- sum(ntheta, nx)
    if(nrv > 0) {
      hnames <- NULL
      if(ntheta > 0) hnames <- c(hnames, sample(model$param.names, ntheta))
      if(nx > 0) hnames <- c(hnames, sample(model$data.names, nx))
      hnames <- sample(hnames)
      mu <- rnorm(nrv)
      names(mu) <- hnames
      Sigma <- crossprod(matrix(rnorm(nrv^2),nrv,nrv))
      dimnames(Sigma) <- list(hnames, hnames)
      lpi <- sde.prior(model = model, theta = init$Theta, x = init$X,
                       hyper = list(mu = mu, Sigma = Sigma))
      lpi.R <- rep(NA, nreps)
      for(jj in 1:nreps) {
        xx <- c(init$Theta.R[jj,], init$X.R[jj,])
        lpi.R[jj] <- lmvn(x = xx[hnames], mean = mu[hnames],
                          cholsd = chol(Sigma)[hnames,hnames])
      }
    } else {
      lpi <- sde.prior(model = model, theta = init$Theta, x = init$X,
                       hyper = NULL)
      lpi.R <- rep(0, nreps)
    }
    if(sx && st) lpi.R <- lpi.R[1]
    mxd[ii,] <- max.diff(lpi, lpi.R)
    expect_equal(mxd[ii,2], 0, tolerance = abs.tol)
  }
})


