library(BaPreStoPro)


### Name: plot,est.hiddenDiffusion-method
### Title: Plot method for the Bayesian estimation results
### Aliases: plot,est.hiddenDiffusion-method

### ** Examples

model <- set.to.class("hiddenDiffusion", b.fun = function(phi, t, y) phi[1]-phi[2]*y,
    parameter = list(phi = c(10, 1), gamma2 = 1, sigma2 = 0.1),
    y0 = function(phi, t) 0.5)
data <- simulate(model, t = seq(0, 1, by = 0.01), plot.series = TRUE)
est <- estimate(model, t = seq(0, 1, by = 0.01), data$Y, 100)  # nMCMC small for example
plot(est)
plot(est, par2plot = c(rep(FALSE, 3), TRUE, FALSE), ylim = c(0.001, 0.1), par.options = list())
plot(est, burnIn = 10, thinning = 2, reduced = TRUE)
plot(est, par.options = list(mar = c(5, 4.5, 4, 2) + 0.1, mfrow = c(3,1)), xlab = "iteration")
plot(est, style = "acf", main = "", par2plot = c(TRUE, TRUE, FALSE, FALSE))
plot(est, style = "density", lwd = 2, priorMean = FALSE)
plot(est, style = "density", col.priorMean = 1, lty.priorMean = 2, main = "posterior")
plot(est, style = "acf", par.options = list(), main = "", par2plot = c(FALSE, FALSE, TRUE, TRUE))



