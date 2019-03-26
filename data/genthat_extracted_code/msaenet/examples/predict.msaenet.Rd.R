library(msaenet)


### Name: predict.msaenet
### Title: Make Predictions from an msaenet Model
### Aliases: predict.msaenet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

msaenet.fit <- msaenet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.2, 0.8, 0.2),
  nsteps = 3L, seed = 1003
)

msaenet.pred <- predict(msaenet.fit, dat$x.te)
msaenet.rmse(dat$y.te, msaenet.pred)



