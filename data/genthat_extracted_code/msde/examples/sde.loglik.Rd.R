library(msde)


### Name: sde.loglik
### Title: SDE loglikelihood function.
### Aliases: sde.loglik

### ** Examples

# load Heston's model
hmod <- sde.examples("hest")

# Simulate data
nreps <- 10
nobs <- 100
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
Theta <- apply(t(replicate(nreps, theta)), 2, jitter)
x0 <- c(X = log(1000), Z = 0.1)
X0 <- apply(t(replicate(nreps,x0)), 2, jitter)
dT <- 1/252
hsim <- sde.sim(model = hmod, x0 = X0, theta = Theta,
                dt = dT, dt.sim = dT/10, nobs = nobs, nreps = nreps)

# single parameter, single data
sde.loglik(model = hmod, x = hsim$data[,,1], dt = dT, theta = theta)
# multiple parameters, single data
sde.loglik(model = hmod, x = hsim$data[,,1], dt = dT, theta = Theta)
# multiple parameters, multiple data
sde.loglik(model = hmod, x = hsim$data, dt = dT, theta = Theta)



