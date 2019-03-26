library(BaPreStoPro)


### Name: plot,est.Regression-method
### Title: Plot method for the Bayesian estimation results
### Aliases: plot,est.Regression-method

### ** Examples

model <- set.to.class("Regression", fun = function(phi, t) phi[1]*t + phi[2],
    parameter = list(phi = c(1, 2), gamma2 = 0.1))
data <- simulate(model, t = seq(0, 1, by = 0.01), plot.series = TRUE)
est <- estimate(model, t = seq(0, 1, by = 0.01), data, 1000)  # nMCMC small for example
plot(est)
plot(est, burnIn = 100, thinning = 2, reduced = TRUE)
plot(est, par.options = list(mar = c(5, 4.5, 4, 2) + 0.1, mfrow = c(3,1)), xlab = "iteration")
plot(est, style = "acf", main = "", par2plot = c(TRUE, TRUE, FALSE))
plot(est, style = "density", lwd = 2, priorMean = FALSE)
plot(est, style = "density", col.priorMean = 1, lty.priorMean = 2, main = "posterior")
plot(est, style = "acf", par.options = list(), main = "", par2plot = c(FALSE, FALSE, TRUE))



