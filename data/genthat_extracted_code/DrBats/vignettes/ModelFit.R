## ---- echo = F-----------------------------------------------------------
rm(list=ls())

## ---- messages = F-------------------------------------------------------
require(DrBats)
mycol<-c("#ee204d", "#1f75fe", "#1cac78", "#ff7538", "#b4674d", "#926eae",
                 "#fce883", "#000000", "#78dbe2", "#6e5160", "#ff43a4")

## ------------------------------------------------------------------------
data("toydata")
proj.data <- toydata$Y.simul$Y

## ---- eval = F-----------------------------------------------------------
#  stanfit <- modelFit(model = "PLT", var.prior = "IG", prog = "stan", parallel = T, Xhisto = proj.data,
#                     nchains = 2, nthin = 10, niter = 1000, R = toydata$wlu$Q)

## ------------------------------------------------------------------------
data("stanfit")
coda.plt <- coda.obj(stanfit)

## ------------------------------------------------------------------------
post <- postdens(coda.plt, Y = toydata$Y.simul$Y, D = toydata$wlu$D, chain = 1)
hist(post, main = "Histogram of the posterior density", xlab = "Density")

## ------------------------------------------------------------------------
beta.res <- visbeta(coda.plt, toydata$Y.simul$Y, toydata$wlu$D, chain = 1, axes = c(1, 2), quant = c(0.05, 0.95))

ggplot2::ggplot() +
ggplot2::geom_path(data = beta.res$contour.df, ggplot2::aes(x = x, y = y, colour = ind)) +
ggplot2::geom_point(data = beta.res$mean.df, ggplot2::aes(x = x, y = y, colour = ind)) +
ggplot2::ggtitle("Convex hull of HMC estimates of the scores")

