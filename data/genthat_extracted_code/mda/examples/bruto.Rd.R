library(mda)


### Name: bruto
### Title: Fit an Additive Spline Model by Adaptive Backfitting
### Aliases: bruto
### Keywords: smooth

### ** Examples

data(trees)
fit1 <- bruto(trees[,-3], trees[3])
fit1$type
fit1$df
## examine the fitted functions
par(mfrow=c(1,2), pty="s")
Xp <- matrix(sapply(trees[1:2], mean), nrow(trees), 2, byrow=TRUE)
for(i in 1:2) {
  xr <- sapply(trees, range)
  Xp1 <- Xp; Xp1[,i] <- seq(xr[1,i], xr[2,i], len=nrow(trees))
  Xf <- predict(fit1, Xp1)
  plot(Xp1[ ,i], Xf, xlab=names(trees)[i], ylab="", type="l")
}



