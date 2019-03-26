library(msaenet)


### Name: msamnet
### Title: Multi-Step Adaptive MCP-Net
### Aliases: msamnet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

msamnet.fit <- msamnet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.3, 0.9, 0.3),
  nsteps = 3L, seed = 1003
)

print(msamnet.fit)
msaenet.nzv(msamnet.fit)
msaenet.fp(msamnet.fit, 1:5)
msaenet.tp(msamnet.fit, 1:5)
msamnet.pred <- predict(msamnet.fit, dat$x.te)
msaenet.rmse(dat$y.te, msamnet.pred)
plot(msamnet.fit)



