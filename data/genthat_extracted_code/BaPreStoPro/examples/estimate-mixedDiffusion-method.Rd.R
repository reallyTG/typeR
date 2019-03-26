library(BaPreStoPro)


### Name: estimate,mixedDiffusion-method
### Title: Estimation for hierarchical (mixed) diffusion model
### Aliases: estimate,mixedDiffusion-method

### ** Examples

mu <- 2; Omega <- 0.4; phi <- matrix(rnorm(21, mu, sqrt(Omega)))
model <- set.to.class("mixedDiffusion",
             parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
             b.fun = function(phi, t, x) phi*x, sT.fun = function(t, x) x)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data[1:20,], 100)  # nMCMC should be much larger
plot(est)

# OU
b.fun <- function(phi, t, y) phi[1]-phi[2]*y; y0.fun <- function(phi, t) phi[3]
mu <- c(10, 5, 0.5); Omega <- c(0.9, 0.01, 0.01)
phi <- sapply(1:3, function(i) rnorm(21, mu[i], sqrt(Omega[i])))
model <- set.to.class("mixedDiffusion",
               parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
               y0.fun = y0.fun, b.fun = b.fun, sT.fun = function(t, x) 1)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data[1:20,], 100)  # nMCMC should be much larger
plot(est)

##
t.list <- list()
for(i in 1:20) t.list[[i]] <- t
t.list[[21]] <- t[1:50]
data.list <- list()
for(i in 1:20) data.list[[i]] <- data[i,]
data.list[[21]] <- data[21, 1:50]
est <- estimate(model, t.list, data.list, 100)
pred <- predict(est, t = t[50:101], which.series = "current", ind.pred = 21,
   b.fun.mat = function(phi, t, y) phi[,1]-phi[,2]*y)



