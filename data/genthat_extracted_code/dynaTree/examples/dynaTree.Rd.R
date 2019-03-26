library(dynaTree)


### Name: dynaTrees
### Title: Fitting Dynamic Tree Models
### Aliases: dynaTrees dynaTree
### Keywords: nonparametric tree regression nonlinear classif

### ** Examples

## simple parabolic data
n <- 100
Xp <- sort(runif(n,-3,3))
Yp <- Xp + Xp^2 + rnorm(n, 0, .2)

## fit a piece-wise linear model
parab.fit <- dynaTree(Xp, Yp, model="linear")

## obtain predictions at a new set of locations
## and plot
parab.fit <- predict(parab.fit, XX=seq(-3, 3, length=100))
plot(parab.fit)

## try duplicating the object
parab.fit.copy <- copy(parab.fit)

## must delete the cloud or memory may leak
deletecloud(parab.fit); parab.fit$num <- NULL
## to delete all clouds, do:
deleteclouds()

## for more examples of dynaTree see update.dynaTree

## Motorcycle accident data
library(MASS)
data(mcycle)
Xm <- mcycle[,1]
Ym <- mcycle[,2]
XXm <- seq(min(mcycle[,1]), max(mcycle[,1]), length=100)

R <- 2 ## use R >= 10 for better results
## small R is for faster CRAN checks
## fit constant model with R=2 repeats and predictions
moto.fit <- dynaTrees(Xm, Ym, XX=XXm, R=R, plotit=TRUE)

## plot the averages
plot(moto.fit, ptype="mean")

## clouds automatically deleted by dynaTrees

## Not run: 
##D ## 2-d/3-class classification data
##D library(plgp)
##D library(tgp)
##D xx <- seq(-2, 2, length=20)
##D XX <- expand.grid(xx, xx)
##D X <- dopt.gp(125, Xcand=XX)$XX
##D C <- exp2d.C(X)
##D 
##D ## fit a classification model with R=10 repeats, 
##D class.fit <- dynaTrees(X, C, XX=XX, model="class")
##D 
##D ## for plot the output (no generic plotting available)
##D cols <- c(gray(0.85), gray(0.625), gray(0.4))
##D par(mfrow=c(1,2))
##D library(akima)
##D 
##D ## plot R-averaged predicted class
##D mclass <- apply(class.fit$p, 1, which.max)
##D image(interp(XX[,1], XX[,2], mclass), col=cols,
##D       xlab="x1", ylab="x2", main="repeated class mean")
##D points(X)
##D ## plot R-averaged entropy
##D ment <-  apply(class.fit$entropy, 1, mean)
##D image(interp(XX[,1], XX[,2], ment),
##D       xlab="x1", ylab="x2", main="repeated entropy mean")
## End(Not run)



