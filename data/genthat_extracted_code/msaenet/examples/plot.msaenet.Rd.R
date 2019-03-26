library(msaenet)


### Name: plot.msaenet
### Title: Plot msaenet Model Objects
### Aliases: plot.msaenet

### ** Examples

dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.6,
  coef = rep(1, 5), snr = 2, p.train = 0.7,
  seed = 1001
)

msasnet.fit <- msasnet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.2, 0.8, 0.2),
  nsteps = 5L, tune.nsteps = "ebic",
  seed = 1003
)

plot(msasnet.fit)
plot(msasnet.fit, label = TRUE)
plot(msasnet.fit, label = TRUE, nsteps = 5)
plot(msasnet.fit, type = "criterion")
plot(msasnet.fit, type = "criterion", nsteps = 5)
plot(msasnet.fit, type = "dotplot", label = TRUE)
plot(msasnet.fit, type = "dotplot", label = TRUE, abs = TRUE)



