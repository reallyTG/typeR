library(OHPL)


### Name: OHPL
### Title: Ordered Homogeneity Pursuit Lasso
### Aliases: OHPL

### ** Examples

# generate simulation data
dat = OHPL.sim(
  n = 100, p = 100, rho = 0.8,
  coef = rep(1, 10), snr = 3, p.train = 0.5,
  seed = 1010)

# split training and test set
x = dat$x.tr
y = dat$y.tr
x.test = dat$x.te
y.test = dat$y.te

# fit the OHPL model
fit = OHPL(x, y, maxcomp = 3, gamma = 0.5, G = 10, type = "max")
# selected variables
fit$Vsel
# make predictions
y.pred = predict(fit, x.test)
# compute evaluation metric RMSEP, Q2 and MAE for the test set
perf = OHPL.RMSEP(fit, x.test, y.test)
perf$RMSEP
perf$Q2
perf$MAE



