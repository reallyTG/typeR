library(msde)


### Name: mou.loglik
### Title: Loglikelihood for multivariate Ornstein-Uhlenbeck process.
### Aliases: mou.loglik

### ** Examples

## No test: 
# bivariate OU model
bmod <- sde.examples("biou")

# simulate some data

# true parameter values
Gamma0 <- .1 * crossprod(matrix(rnorm(4),2,2))
Lambda0 <- rnorm(2)
Phi0 <- crossprod(matrix(rnorm(4),2,2))
Psi0 <- chol(Phi0) # precompiled model uses the Cholesky scale
theta0 <- c(Gamma0, Lambda0, Psi0[c(1,3,4)])
names(theta0) <- bmod$param.names
# initial value
Y0 <- rnorm(2)
names(Y0) <- bmod$data.names

# simulation
dT <- runif(1, max = .1) # time step
nObs <- 10
bsim <- sde.sim(bmod, x0 = Y0, theta = theta0,
                dt = dT, dt.sim = dT, nobs = nObs)
YObs <- bsim$data

# inference via MCMC
binit <- sde.init(bmod, x = YObs, dt = dT, theta = theta0,
                  nvar.obs = 1) # second component is unobserved
# only Lambda1 is unknown
fixed.params <- rep(TRUE, bmod$nparams)
names(fixed.params) <- bmod$param.names
fixed.params["Lambda1"] <- FALSE
# prior on (Lambda1, Y_0)
hyper <- list(mu = c(0,0), Sigma = diag(2))
names(hyper$mu) <- bmod$data.names
dimnames(hyper$Sigma) <- rep(list(bmod$data.names), 2)

# posterior sampling
nsamples <- 1e5
burn <- 1e3
bpost <- sde.post(bmod, binit, hyper = hyper,
                  fixed.params = fixed.params,
                  nsamples = nsamples, burn = burn)
L1.mcmc <- bpost$params[,"Lambda1"]

# analytic posterior
L1.seq <- seq(min(L1.mcmc), max(L1.mcmc), len = 500)
L1.loglik <- sapply(L1.seq, function(l1) {
  lambda <- Lambda0
  lambda[1] <- l1
  mou.loglik(X = YObs, dt = dT, nvar.obs = 1,
             Gamma = Gamma0, Lambda = lambda, Phi = Phi0,
             mu0 = hyper$mu, Sigma0 = hyper$Sigma)
})
# normalize density
L1.Kalman <- exp(L1.loglik - max(L1.loglik))
L1.Kalman <- L1.Kalman/sum(L1.Kalman)/(L1.seq[2]-L1.seq[1])

# compare
hist(L1.mcmc, breaks = 100, freq = FALSE,
     main = expression(p(Lambda[1]*" | "*bold(Y)[1])),
     xlab = expression(Lambda[1]))
lines(L1.seq, L1.Kalman, col = "red")
legend("topright", legend = c("Analytic", "MCMC"),
       pch = c(NA, 22), lty = c(1, NA), col = c("red", "black"))
## End(No test)



