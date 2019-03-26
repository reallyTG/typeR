library(msaenet)


### Name: aenet
### Title: Adaptive Elastic-Net
### Aliases: aenet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

aenet.fit <- aenet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.2, 0.8, 0.2), seed = 1002
)

print(aenet.fit)
msaenet.nzv(aenet.fit)
msaenet.fp(aenet.fit, 1:5)
msaenet.tp(aenet.fit, 1:5)
aenet.pred <- predict(aenet.fit, dat$x.te)
msaenet.rmse(dat$y.te, aenet.pred)
plot(aenet.fit)



