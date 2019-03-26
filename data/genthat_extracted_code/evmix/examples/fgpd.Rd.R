library(evmix)


### Name: fgpd
### Title: MLE Fitting of Generalised Pareto Distribution (GPD)
### Aliases: fgpd lgpd nlgpd lgpd fgpd nlgpd nlgpd fgpd lgpd

### ** Examples

set.seed(1)
par(mfrow = c(2, 1))

# GPD is conditional model for threshold exceedances
# so tail fraction phiu not relevant when only have exceedances
x = rgpd(1000, u = 10, sigmau = 5, xi = 0.2)
xx = seq(0, 100, 0.1)
hist(x, breaks = 100, freq = FALSE, xlim = c(0, 100))
lines(xx, dgpd(xx, u = 10, sigmau = 5, xi = 0.2))
fit = fgpd(x, u = 10)
lines(xx, dgpd(xx, u = fit$u, sigmau = fit$sigmau, xi = fit$xi), col="red")

# but tail fraction phiu is needed for conditional modelling of population tail
x = rnorm(10000)
xx = seq(-4, 4, 0.01)
hist(x, breaks = 200, freq = FALSE, xlim = c(0, 4))
lines(xx, dnorm(xx), lwd = 2)
fit = fgpd(x, u = 1)
lines(xx, dgpd(xx, u = fit$u, sigmau = fit$sigmau, xi = fit$xi, phiu = fit$phiu),
  col = "red", lwd = 2)
legend("topright", c("True Density","Fitted Density"), col=c("black", "red"), lty = 1)




