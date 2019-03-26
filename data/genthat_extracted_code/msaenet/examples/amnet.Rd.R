library(msaenet)


### Name: amnet
### Title: Adaptive MCP-Net
### Aliases: amnet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

amnet.fit <- amnet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.2, 0.8, 0.2), seed = 1002
)

print(amnet.fit)
msaenet.nzv(amnet.fit)
msaenet.fp(amnet.fit, 1:5)
msaenet.tp(amnet.fit, 1:5)
amnet.pred <- predict(amnet.fit, dat$x.te)
msaenet.rmse(dat$y.te, amnet.pred)
plot(amnet.fit)



