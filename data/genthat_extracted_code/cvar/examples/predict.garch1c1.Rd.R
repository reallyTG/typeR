library(cvar)


### Name: predict.garch1c1
### Title: Prediction for GARCH(1,1) time series
### Aliases: predict.garch1c1

### ** Examples

## set up a model and simulate a time series
mo <- GarchModel(omega = 0.4, alpha = 0.3, beta = 0.5)
a1 <- sim_garch1c1(mo, n = 1000, n.start = 100)

## predictions for T+1,...,T+5 (T = time of last value)
## Nsim is small to reduce the load on CRAN, usually Nsim is larger.
a.pred <- predict(mo, n.ahead = 5, Nsim = 1000, eps = a1$eps, sigmasq = a1$h, seed = 1234)

## preditions for the time series
a.pred$eps

## PI's for eps - plug-in and simulated
a.pred$pi_plugin
a.pred$pi_sim

## a DIY alculation of PI's using the simulated sample paths
t(apply(a.pred$dist_sim$eps, 1, function(x) quantile(x, c(0.025, 0.975))))

## further investigate the predictive distributions
t(apply(a.pred$dist_sim$eps, 1, function(x) summary(x)))

## compare predictive densities for h=2 and h=5
plot(density(a.pred$dist_sim$eps[2, ]), ylim = c(0,.25))
lines(density(a.pred$dist_sim$eps[5, ]), col = "blue")

## predictions of sigma_t^2
a.pred$h

## plug-in predictions of sigma_t
sqrt(a.pred$h)

## simulation predictive densities of sigma_t for h = 2 and h = 5
plot(density(sqrt(a.pred$dist_sim$h[2, ])), xlim = c(0, 6))
lines(density(sqrt(a.pred$dist_sim$h[5, ])), col = "blue")

## VaR and ES for different horizons
cbind(h = 1:5,
      VaR = apply(a.pred$dist_sim$eps, 1, function(x) VaR(x, c(0.05))),
      ES = apply(a.pred$dist_sim$eps, 1, function(x) ES(x, c(0.05))) )

## fit a GARCH(1,1) model to exchange rate data and predict
gmo1 <- fGarch::garchFit(formula = ~garch(1, 1), data = fGarch::dem2gbp,
  include.mean = FALSE, cond.dist = "norm", trace = FALSE)
mocoef <- gmo1@fit$par
mofitted <- GarchModel(omega = mocoef["omega"], alpha = mocoef["alpha1"],
  beta = mocoef["beta1"])
gmo1.pred <- predict(mofitted, n.ahead = 5, Nsim = 1000, eps = gmo1@data,
  sigmasq = gmo1@h.t, seed = 1234)
gmo1.pred$pi_plugin
gmo1.pred$pi_sim




