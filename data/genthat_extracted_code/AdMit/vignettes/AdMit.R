### R code from vignette source 'AdMit.Rnw'

###################################################
### code chunk number 1: AdMit.Rnw:105-108
###################################################
rm(list = ls())
library("AdMit")
options(digits = 4, max.print = 40, prompt = "R> ", continue = "+   ")


###################################################
### code chunk number 2: AdMit.Rnw:592-601
###################################################
GelmanMeng <- function(x, A = 1, B = 0, C1 = 3, C2 = 3, log = TRUE)
{
  if (is.vector(x))
    x <- matrix(x, nrow = 1)
  r <- -0.5 * (A * x[,1]^2 * x[,2]^2 + x[,1]^2 + x[,2]^2 - 2 * B * x[,1] * x[,2] - 2 * C1 * x[,1] - 2 * C2 * x[,2])
  if (!log)
    r <- exp(r)
  as.vector(r)
}


###################################################
### code chunk number 3: AdMit.Rnw:608-619
###################################################
PlotGelmanMeng <- function(x1, x2)
{
  GelmanMeng(cbind(x1, x2), log = FALSE)
}
x1 <- x2 <- seq(from = -1.0, to = 6.0, by = 0.05)
z <- outer(x1, x2, FUN = PlotGelmanMeng)
image(x1, x2, z, las = 1, col = gray((20:0)/20),
      cex.axis = 1.1, cex.lab = 1.2,
      xlab = expression(X[1]), ylab = expression(X[2]))
box()
abline(a = 0, b = 1, lty = "dotted")


###################################################
### code chunk number 4: AdMit.Rnw:626-637
###################################################
PlotGelmanMeng <- function(x1, x2)
{
  GelmanMeng(cbind(x1, x2), log = FALSE)
}
x1 <- x2 <- seq(from = -1.0, to = 6.0, by = 0.05)
z <- outer(x1, x2, FUN = PlotGelmanMeng)
image(x1, x2, z, las = 1, col = gray((20:0)/20),
      cex.axis = 1.1, cex.lab = 1.2,
      xlab = expression(X[1]), ylab = expression(X[2]))
box()
abline(a = 0, b = 1, lty = "dotted")


###################################################
### code chunk number 5: AdMit.Rnw:648-651
###################################################
set.seed(1234)
outAdMit <- AdMit(KERNEL = GelmanMeng, mu0 = c(0.0, 0.1))
print(outAdMit)


###################################################
### code chunk number 6: AdMit.Rnw:688-698
###################################################
PlotMit <- function(x1, x2, mit)
{
  dMit(cbind(x1, x2), mit = mit, log = FALSE)
}
z <- outer(x1, x2, FUN = PlotMit, mit = outAdMit$mit)
image(x1, x2, z, las = 1, col = gray((20:0)/20),
      cex.axis = 1.1, cex.lab = 1.2,
      xlab = expression(X[1]), ylab = expression(X[2]))
box()
abline(a = 0, b = 1, lty = "dotted")


###################################################
### code chunk number 7: AdMit.Rnw:703-713
###################################################
PlotMit <- function(x1, x2, mit)
{
  dMit(cbind(x1, x2), mit = mit, log = FALSE)
}
z <- outer(x1, x2, FUN = PlotMit, mit = outAdMit$mit)
image(x1, x2, z, las = 1, col = gray((20:0)/20),
      cex.axis = 1.1, cex.lab = 1.2,
      xlab = expression(X[1]), ylab = expression(X[2]))
box()
abline(a = 0, b = 1, lty = "dotted")


###################################################
### code chunk number 8: AdMit.Rnw:724-739
###################################################
par(mfrow = c(2,2))
for (h in 1:4)
{
  mith <- list(p = 1,
               mu = outAdMit$mit$mu[h,,drop = FALSE],
               Sigma = outAdMit$mit$Sigma[h,,drop = FALSE],
               df = outAdMit$mit$df)
  z <- outer(x1, x2, FUN = PlotMit, mit = mith)
  image(x1, x2, z, las = 1, col = gray((20:0)/20),
        cex.axis = 1.1, cex.lab = 1.2,
        xlab = expression(X[1]), ylab = expression(X[2]))
  box()
  abline(a = 0, b = 1, lty = "dotted")
  title(main = paste("component nr.", h))
}


###################################################
### code chunk number 9: AdMit.Rnw:745-760
###################################################
par(mfrow = c(2,2))
for (h in 1:4)
{
  mith <- list(p = 1,
               mu = outAdMit$mit$mu[h,,drop = FALSE],
               Sigma = outAdMit$mit$Sigma[h,,drop = FALSE],
               df = outAdMit$mit$df)
  z <- outer(x1, x2, FUN = PlotMit, mit = mith)
  image(x1, x2, z, las = 1, col = gray((20:0)/20),
        cex.axis = 1.1, cex.lab = 1.2,
        xlab = expression(X[1]), ylab = expression(X[2]))
  box()
  abline(a = 0, b = 1, lty = "dotted")
  title(main = paste("component nr.", h))
}


###################################################
### code chunk number 10: AdMit.Rnw:790-793
###################################################
set.seed(1234)
outAdMitIS <- AdMitIS(KERNEL = GelmanMeng, mit = outAdMit$mit)
print(outAdMitIS)


###################################################
### code chunk number 11: AdMit.Rnw:825-836
###################################################
G.cov <- function(theta, mu)
{
  G.cov_sub <- function(x)
    (x - mu) %*% t(x - mu)
  theta <- as.matrix(theta)
  tmp <- apply(theta, 1, G.cov_sub)
  if (length(mu) > 1)
    t(tmp)
  else
    as.matrix(tmp)
}


###################################################
### code chunk number 12: AdMit.Rnw:839-844
###################################################
set.seed(1234)
outAdMitIS <- AdMitIS(KERNEL = GelmanMeng, G = G.cov, mit = outAdMit$mit, mu = c(1.459, 1.459))
print(outAdMitIS)
V <- matrix(outAdMitIS$ghat, 2, 2)
print(V)


###################################################
### code chunk number 13: AdMit.Rnw:853-854
###################################################
cov2cor(V)


###################################################
### code chunk number 14: AdMit.Rnw:873-876
###################################################
set.seed(1234)
outAdMitMH <- AdMitMH(KERNEL = GelmanMeng, mit = outAdMit$mit)
print(outAdMitMH)


###################################################
### code chunk number 15: AdMit.Rnw:896-897
###################################################
library("coda")


###################################################
### code chunk number 16: AdMit.Rnw:899-902
###################################################
draws <- as.mcmc(outAdMitMH$draws[1001:1e5,])
colnames(draws) <- c("X1", "X2")
summary(draws)$stat


###################################################
### code chunk number 17: AdMit.Rnw:909-910
###################################################
summary(draws)$stat[,3]^2 / summary(draws)$stat[,4]^2


