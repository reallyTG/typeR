library(msde)


### Name: sde.sim
### Title: Simulation of multivariate SDE trajectories.
### Aliases: sde.sim

### ** Examples

# load pre-compiled model
hmod <- sde.examples("hest")

# initial values
x0 <- c(X = log(1000), Z = 0.1)
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)

# simulate data
dT <- 1/252
nobs <- 2000
burn <- 500
hsim <- sde.sim(model = hmod, x0 = x0, theta = theta,
                dt = dT, dt.sim = dT/10,
                nobs = nobs, burn = burn)

par(mfrow = c(1,2))
plot(hsim$data[,"X"], type = "l", xlab = "Time", ylab = "",
     main = expression(X[t]))
plot(hsim$data[,"Z"], type = "l", xlab = "Time", ylab = "",
     main = expression(Z[t]))



