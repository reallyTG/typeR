## ----eval=FALSE----------------------------------------------------------
#  if(!require("msma")) install.packages("msma")

## ------------------------------------------------------------------------
library(msma)

## ------------------------------------------------------------------------
dataset0 = simdata(n = 50, rho = 0.8, Yps = c(3, 4, 5), Xps = 3, seed=1)
X0 = dataset0$X; Y0 = dataset0$Y 

## ------------------------------------------------------------------------
fit01 = msma(X0, Y0, comp=1, lambdaX=0.05, lambdaY=1:3)
fit01
plot(fit01)

## ------------------------------------------------------------------------
fit02 = msma(X0, Y0, comp=2, lambdaX=0.03, lambdaY=0.01*(1:3))
fit02

## ------------------------------------------------------------------------
dataset1 = simdata(n = 50, rho = 0.8, Yps = 5, Xps = 5, seed=1)
X1 = dataset1$X[[1]]; Y1 = dataset1$Y 

## ------------------------------------------------------------------------
(fit111 = msma(X1, comp=5))

## ------------------------------------------------------------------------
fit111$wbX

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plot(fit111, axes = 1, plottype="bar")
plot(fit111, axes = 2, plottype="bar")

## ------------------------------------------------------------------------
lapply(fit111$sbX, head)

## ------------------------------------------------------------------------
plot(fit111, v="score", axes = 1:2, plottype="scatter")
plot(fit111, v="score", axes = 2:3, plottype="scatter")

## ------------------------------------------------------------------------
par(mfrow=c(1,1))
plot(fit111, v="cpev")

## ------------------------------------------------------------------------
(fit1112 = prcomp(X1, scale=TRUE))
summary(fit1112)
biplot(fit1112)

## ------------------------------------------------------------------------
(fit112 = msma(X1, comp=5, lambdaX=0.1))
par(mfrow=c(1,2))
plot(fit112, axes = 1, plottype="bar")
plot(fit112, axes = 2, plottype="bar")

## ------------------------------------------------------------------------
set.seed(1); Z = rbinom(50, 1, 0.5)

(fit113 = msma(X1, Z=Z, comp=5, lambdaX=0.02))
par(mfrow=c(1,2))
plot(fit113, axes = 1, plottype="bar")
plot(fit113, axes = 2, plottype="bar")

## ------------------------------------------------------------------------
(fit121 = msma(X1, Y1, comp=2))
par(mfrow=c(1,2))
plot(fit121, axes = 1, XY="XY")
plot(fit121, axes = 2, XY="XY")

## ------------------------------------------------------------------------
(fit122 = msma(X1, Y1, comp=2, lambdaX=0.5, lambdaY=0.5))
par(mfrow=c(1,2))
plot(fit122, axes = 1, XY="XY")
plot(fit122, axes = 2, XY="XY")

## ------------------------------------------------------------------------
(fit123 = msma(X1, Y1, Z, comp=2, lambdaX=0.5, lambdaY=0.5))
par(mfrow=c(1,2))
plot(fit123, axes = 1, XY="XY")
plot(fit123, axes = 2, XY="XY")

## ------------------------------------------------------------------------
dataset2 = simdata(n = 50, rho = 0.8, Yps = c(2, 3), Xps = c(3, 4), seed=1)
X2 = dataset2$X; Y2 = dataset2$Y 

## ------------------------------------------------------------------------
class(X2)

## ------------------------------------------------------------------------
length(X2)

## ------------------------------------------------------------------------
lapply(X2, dim)

## ------------------------------------------------------------------------
(fit211 = msma(X2, comp=1))

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plot(fit211, axes = 1, plottype="bar", block="block")
plot(fit211, axes = 1, plottype="bar", block="super")

## ------------------------------------------------------------------------
(fit212 = msma(X2, comp=1, lambdaX=c(0.5, 0.5)))

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
plot(fit212, axes = 1, plottype="bar", block="block")
plot(fit212, axes = 1, plottype="bar", block="super")

## ------------------------------------------------------------------------
(fit213 = msma(X2, Z=Z, comp=1, lambdaX=c(0.5, 0.5)))
par(mfrow=c(1,2))
plot(fit213, axes = 1, plottype="bar", block="block")
plot(fit213, axes = 1, plottype="bar", block="super")

## ------------------------------------------------------------------------
(fit221 = msma(X2, Y2, comp=1))
par(mfrow=c(1,2))
plot(fit221, axes = 1, plottype="bar", block="block", XY="X")
plot(fit221, axes = 1, plottype="bar", block="super", XY="X")
plot(fit221, axes = 1, plottype="bar", block="block", XY="Y")
plot(fit221, axes = 1, plottype="bar", block="super", XY="Y")

## ------------------------------------------------------------------------
(fit222 = msma(X2, Y2, comp=1, lambdaX=c(0.5, 0.5), lambdaY=c(0.5, 0.5)))
par(mfrow=c(1,2))
plot(fit222, axes = 1, plottype="bar", block="block", XY="X")
plot(fit222, axes = 1, plottype="bar", block="super", XY="X")
plot(fit222, axes = 1, plottype="bar", block="block", XY="Y")
plot(fit222, axes = 1, plottype="bar", block="super", XY="Y")

## ------------------------------------------------------------------------
(fit223 = msma(X2, Y2, Z, comp=1, lambdaX=c(0.5, 0.5), lambdaY=c(0.5, 0.5)))
par(mfrow=c(1,2))
plot(fit223, axes = 1, plottype="bar", block="block", XY="X")
plot(fit223, axes = 1, plottype="bar", block="super", XY="X")
plot(fit223, axes = 1, plottype="bar", block="block", XY="Y")
plot(fit223, axes = 1, plottype="bar", block="super", XY="Y")

## ------------------------------------------------------------------------
criteria = c("BIC", "CV")
search.methods = c("regparaonly", "regpara1st", "ncomp1st", "simultaneous")
c1=criteria[1]; sm1=search.methods[1]
(opt1 = optparasearch(X1, search.method = sm1, criterion=c1))
(fit31 = msma(X1, comp=opt1$optncomp, lambdaX=opt1$optlambdaX))

## ------------------------------------------------------------------------
(opt2 = optparasearch(X2, Y2, search.method = sm1, criterion=c1))
(fit32 = msma(X2, Y2, comp=opt2$optncomp, lambdaX=opt2$optlambdaX, lambdaY=opt2$optlambdaY))

