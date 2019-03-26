library(ESGtoolkit)


### Name: simdiff
### Title: Simulation of diffusion processes.
### Aliases: simdiff

### ** Examples

kappa <- 1.5
V0 <- theta <- 0.04
sigma_v <- 0.2
theta1 <- kappa*theta
theta2 <- kappa
theta3 <- sigma_v

# OU

sim.OU <- simdiff(n = 10, horizon = 5,
               frequency = "quart",
               model = "OU",
               x0 = V0, theta1 = theta1, theta2 = theta2, theta3 = theta3)
head(sim.OU)
par(mfrow=c(2,1))
esgplotbands(sim.OU, xlab = "time", ylab = "values", main = "with esgplotbands")
matplot(time(sim.OU), sim.OU, type = 'l', main = "with matplot")


# OU with simulated shocks (check the dimensions)

eps0 <- simshocks(n = 50, horizon = 5, frequency = "quart", method = "anti")
sim.OU <- simdiff(n = 50, horizon = 5, frequency = "quart",
               model = "OU",
               x0 = V0, theta1 = theta1, theta2 = theta2, theta3 = theta3,
               eps = eps0)
par(mfrow=c(2,1))
esgplotbands(sim.OU, xlab = "time", ylab = "values", main = "with esgplotbands")
matplot(time(sim.OU), sim.OU, type = 'l', main = "with matplot")
# a different plot
esgplotts(sim.OU)


# CIR

sim.CIR <- simdiff(n = 50, horizon = 5,
               frequency = "quart",
               model = "CIR",
               x0 = V0, theta1 = theta1, theta2 = theta2, theta3 = 0.05)
esgplotbands(sim.CIR, xlab = "time", ylab = "values", main = "with esgplotbands")
matplot(time(sim.CIR), sim.CIR, type = 'l', main = "with matplot")



# GBM

eps0 <- simshocks(n = 100, horizon = 5, frequency = "quart")
sim.GBM <- simdiff(n = 100, horizon = 5, frequency = "quart",
               model = "GBM",
               x0 = 100, theta1 = 0.03, theta2 = 0.1,
               eps = eps0)
esgplotbands(sim.GBM, xlab = "time", ylab = "values", main = "with esgplotbands")
matplot(time(sim.GBM), sim.GBM, type = 'l', main = "with matplot")


eps0 <- simshocks(n = 100, horizon = 5, frequency = "quart")
sim.GBM <- simdiff(n = 100, horizon = 5, frequency = "quart",
               model = "GBM",
               x0 = 100, theta1 = 0.03, theta2 = 0.1,
               eps = eps0)
esgplotbands(sim.GBM, xlab = "time", ylab = "values", main = "with esgplotbands")
matplot(time(sim.GBM), sim.GBM, type = 'l', main = "with matplot")



