## ---- echo = F-----------------------------------------------------------
mycol<-c("#ee204d", "#1f75fe", "#1cac78", "#ff7538", "#b4674d", "#926eae",
         "#fce883", "#000000", "#78dbe2", "#6e5160", "#ff43a4")

## ------------------------------------------------------------------------
suppressPackageStartupMessages(require(DrBats))
set.seed = 45
toydata <- drbats.simul(N = 5,
                        P = 150,
                        t.range = c(0, 1000),
                        b.range = c(0.2, 0.4),
                        c.range = c(0.6, 0.8),
                        b.sd = 5,
                        c.sd = 5,
                        y.range = c(-5, 5),
                        sigma2 = 0.2,
                        breaks = 8,
                        data.type = 'sparse.tend')

## ------------------------------------------------------------------------
matplot(t(toydata$t), t(toydata$X), type = 'l', lty = 1, lwd = 1,
        xlab = 'Time', ylab = ' ')
points(t(toydata$t), t(toydata$X), pch = '.')

## ------------------------------------------------------------------------
barplot(toydata$proj.pca$lambda.perc, ylim = c(0, 1),
        col = mycol[1:length(toydata$proj.pca$lambda.perc)])

## ---- echo = F-----------------------------------------------------------
print(paste("Number of retained axes: ", toydata$wlu$D, sep = ""))

## ---- eval = F-----------------------------------------------------------
#  fit <- modelFit(model = "PLT", var.prior = "IG", prog = "stan", Xhisto = toydata$Y.simul$Y,
#                  nchains = 4, nthin = 50, niter = 10000, D = toydata$wlu$D)

## ---- echo = F-----------------------------------------------------------
data("toydata")
data("stanfit")

## ---- echo = F-----------------------------------------------------------
codafit <- coda.obj(stanfit)

## ------------------------------------------------------------------------
post <- postdens(codafit, Y = toydata$Y.simul$Y, D = toydata$wlu$D, chain = 1)
hist(post, main = "Histogram of the posterior density", xlab = "Density")

## ------------------------------------------------------------------------
beta.res <- visbeta(codafit, toydata$Y.simul$Y, toydata$wlu$D, chain = 1, axes = c(1, 2), quant = c(0.05, 0.95))
 
ggplot2::ggplot() +
  ggplot2::geom_path(data = beta.res$contour.df, ggplot2::aes(x = x, y = y, colour = ind)) +
  ggplot2::geom_point(data = beta.res$mean.df, ggplot2::aes(x = x, y = y, colour = ind)) +
 ggplot2::ggtitle("Convex hull of Score Estimates")

## ------------------------------------------------------------------------
W.res <- visW(codafit, toydata$Y.simul$Y, toydata$wlu$D, chain = 1, factors = c(1, 2))
W.df <- data.frame(time = 1:9, W.res$res.W)
ggplot2::ggplot() +
  ggplot2::geom_step(data = W.df, ggplot2::aes(x = time, y = Estimation, colour = Factor)) +
  ggplot2::geom_step(data = W.df, ggplot2::aes(x = time, y = Lower.est, colour = Factor), linetype = 3) +
  ggplot2::geom_step(data = W.df, ggplot2::aes(x = time, y = Upper.est, colour = Factor), linetype = 3) +
  ggplot2::ggtitle("Latent Factor Estimations")

