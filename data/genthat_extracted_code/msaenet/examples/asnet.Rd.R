library(msaenet)


### Name: asnet
### Title: Adaptive SCAD-Net
### Aliases: asnet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

asnet.fit <- asnet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.2, 0.8, 0.2), seed = 1002
)

print(asnet.fit)
msaenet.nzv(asnet.fit)
msaenet.fp(asnet.fit, 1:5)
msaenet.tp(asnet.fit, 1:5)
asnet.pred <- predict(asnet.fit, dat$x.te)
msaenet.rmse(dat$y.te, asnet.pred)
plot(asnet.fit)



