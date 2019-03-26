library(BaPreStoPro)


### Name: estimate,mixedRegression-method
### Title: Estimation for the hierarchical (mixed) regression model
### Aliases: estimate,mixedRegression-method

### ** Examples

mu <- c(10, 5); Omega <- c(0.9, 0.01)
phi <- cbind(rnorm(21, mu[1], sqrt(Omega[1])), rnorm(21, mu[2], sqrt(Omega[2])))
model <- set.to.class("mixedRegression",
                 parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 0.1),
                 fun = function(phi, t) phi[1]*t + phi[2], sT.fun = function(t) 1)
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = FALSE)
est <- estimate(model, t, data[1:20,], 1000)
plot(est)



