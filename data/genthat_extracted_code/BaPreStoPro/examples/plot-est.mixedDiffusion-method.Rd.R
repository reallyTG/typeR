library(BaPreStoPro)


### Name: plot,est.mixedDiffusion-method
### Title: Plot method for the Bayesian estimation results
### Aliases: plot,est.mixedDiffusion-method

### ** Examples

mu <- c(10, 3, 1); Omega = c(1, 0.4, 0.01)
phi <- sapply(1:3, function(i) rnorm(20, mu[i], sqrt(Omega[i])))
model <- set.to.class("mixedDiffusion", b.fun = function(phi, t, y) phi[1]-phi[2]*y,
    parameter = list(mu = mu, Omega = Omega, phi = phi, gamma2 = 0.1),
    y0 = function(phi, t) phi[3], sT.fun = function(t, x) sqrt(abs(x)))
data <- simulate(model, t = seq(0, 1, by = 0.02), plot.series = TRUE)
est <- estimate(model, t = seq(0, 1, by = 0.02), data, 100)  # nMCMC small for example
plot(est, burnIn = 10, thinning = 2, reduced = TRUE)
plot(est, par.options = list(mar = c(5, 4.5, 4, 2) + 0.1, mfrow = c(2,1)), xlab = "iteration")
plot(est, style = "acf", main = "")
plot(est, style = "density", lwd = 2, priorMean = FALSE)
plot(est, style = "density", col.priorMean = 1, lty.priorMean = 2, main = "posterior")
plot(est, style = "acf", par.options = list(), main = "", par2plot = c(rep(FALSE, 6), TRUE))
plot(est, style = "int.phi", phi = phi, par2plot = c(TRUE, FALSE, FALSE))



