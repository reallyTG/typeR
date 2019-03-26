library(BaPreStoPro)


### Name: plot,est.NHPP-method
### Title: Plot method for the Bayesian estimation results
### Aliases: plot,est.NHPP-method

### ** Examples

model <- set.to.class("NHPP", parameter = list(xi = c(5, 1/2)),
  Lambda = function(t, xi) (t/xi[2])^xi[1])
data <- simulate(model, t = seq(0, 1, by = 0.01), plot.series = TRUE)
est <- estimate(model, t = seq(0, 1, by = 0.01), data$Times, 10000)  # nMCMC small for example
plot(est)
plot(est, burnIn = 1000, thinning = 20, reduced = TRUE)
plot(est, xlab = "iteration")
plot(est, style = "acf", main = "", par2plot = c(TRUE, FALSE), par.options = list(mfrow = c(1, 1)))
plot(est, style = "density", lwd = 2, priorMean = FALSE)
plot(est, style = "density", col.priorMean = 1, lty.priorMean = 2, main = "posterior")
plot(est, style = "acf", par.options = list(), par2plot = c(FALSE, TRUE), main = "")



