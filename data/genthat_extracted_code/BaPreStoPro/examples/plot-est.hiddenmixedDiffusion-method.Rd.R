library(BaPreStoPro)


### Name: plot,est.hiddenmixedDiffusion-method
### Title: Plot method for the Bayesian estimation results
### Aliases: plot,est.hiddenmixedDiffusion-method

### ** Examples

## Not run: 
##D mu <- c(10, 3, 1); Omega = c(1, 0.4, 0.01)
##D phi <- sapply(1:3, function(i) rnorm(20, mu[i], sqrt(Omega[i])))
##D model <- set.to.class("hiddenmixedDiffusion", b.fun = function(phi, t, y) phi[1]-phi[2]*y,
##D     parameter = list(mu = mu, Omega = Omega, phi = phi, gamma2 = 1, sigma2 = 0.1),
##D     y0 = function(phi, t) phi[3])
##D data <- simulate(model, t = seq(0, 1, by = 0.02), plot.series = TRUE)
##D est <- estimate(model, t = seq(0, 1, by = 0.02), data$Z, 1000)
##D plot(est, burnIn = 10, thinning = 2, reduced = TRUE)
##D plot(est, par.options = list(mar = c(5, 4.5, 4, 2) + 0.1, mfrow = c(2,1)), xlab = "iteration")
##D plot(est, style = "acf", main = "", par2plot = c(TRUE, TRUE, rep(FALSE, 7)))
##D plot(est, style = "density", lwd = 2, priorMean = FALSE,
##D    par2plot = c(rep(FALSE, 6), TRUE, TRUE, FALSE))
##D plot(est, style = "density", col.priorMean = 1, lty.priorMean = 2, main = "posterior")
##D plot(est, style = "acf", par.options = list(), main = "", par2plot = c(rep(FALSE, 6), TRUE, TRUE))
##D plot(est, style = "int.phi", phi = phi, par2plot = c(TRUE, FALSE, FALSE))
## End(Not run)



