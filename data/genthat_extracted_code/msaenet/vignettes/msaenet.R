## ------------------------------------------------------------------------
library("msaenet")

## ------------------------------------------------------------------------
dat <- msaenet.sim.gaussian(
  n = 150, p = 500, rho = 0.7,
  coef = rep(1, 5), snr = 3, p.train = 0.7,
  seed = 1001
)

## ------------------------------------------------------------------------
msaenet.fit <- msaenet(
  dat$x.tr, dat$y.tr,
  alphas = seq(0.1, 0.9, 0.1),
  nsteps = 10L, tune.nsteps = "ebic",
  seed = 1005
)

## ---- eval=FALSE---------------------------------------------------------
#  library("doParallel")
#  registerDoParallel(detectCores())

## ------------------------------------------------------------------------
msaenet.fit$best.step
msaenet.nzv(msaenet.fit)
msaenet.nzv.all(msaenet.fit)
msaenet.fp(msaenet.fit, 1:5)
msaenet.tp(msaenet.fit, 1:5)

## ------------------------------------------------------------------------
msaenet.pred <- predict(msaenet.fit, dat$x.te)
msaenet.rmse(dat$y.te, msaenet.pred)
msaenet.mae(dat$y.te, msaenet.pred)

## ---- fig.width = 10, fig.height = 8, out.width = 750, out.height = 600, fig.retina = 2----
plot(msaenet.fit, label = TRUE)

## ---- fig.width = 10, fig.height = 6, out.width = 750, out.height = 450, fig.retina = 2----
plot(msaenet.fit, type = "criterion")

## ---- fig.width = 10, fig.height = 8, out.width = 750, out.height = 600, fig.retina = 2----
plot(msaenet.fit, type = "dotplot", label = TRUE, label.cex = 1)

