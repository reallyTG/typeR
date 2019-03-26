library(msaenet)


### Name: msasnet
### Title: Multi-Step Adaptive SCAD-Net
### Aliases: msasnet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

msasnet.fit <- msasnet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.3, 0.9, 0.3),
  nsteps = 3L, seed = 1003
)

print(msasnet.fit)
msaenet.nzv(msasnet.fit)
msaenet.fp(msasnet.fit, 1:5)
msaenet.tp(msasnet.fit, 1:5)
msasnet.pred <- predict(msasnet.fit, dat$x.te)
msaenet.rmse(dat$y.te, msasnet.pred)
plot(msasnet.fit)



