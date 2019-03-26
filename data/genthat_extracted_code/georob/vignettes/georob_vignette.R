### R code from vignette source 'georob_vignette.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(
  SweaveHooks=list(
    fig=function(){
      par(
        mar=c(3.1, 3.1, 2.1, 2.1), mgp = c(1.5, 0.25, 0), tcl = -0.25
      )
    }
  ),
  width=80, str=strOptions(strict.width="cut"),
  digits=5
)
grDevices::pdf.options( useDingbats = FALSE )
t.t <- (1:9)
t.tick.locations <- c(
  t.t*0.0001, t.t*0.001, t.t*0.01, t.t*0.1, t.t, t.t*10, t.t*100, t.t*1000,
  t.t*10000, t.t*100000, t.t*1000000
)

t.tl <- c(1, 2, NA, NA, 5, NA, NA, NA, NA )
t.tick.labels <- as.character(
  c( t.tl*0.0001, t.tl*0.001, t.tl*0.01, t.tl*0.1, t.tl, t.tl*10, t.tl*100, t.tl*1000,
    t.tl*10000,  t.tl*100000,  t.tl*1000000
  )
)
# my.ncores <- parallel::detectCores()     # <<- Anpassen!!
my.ncores <- 1     # <<- Anpassen!!


###################################################
### code chunk number 2: meuse-zinc-load
###################################################
if(file.exists("r_meuse_zinc_objects.RData")) load("r_meuse_zinc_objects.RData")


###################################################
### code chunk number 3: meuse-data
###################################################
data(meuse, package="sp")
levels(meuse$ffreq) <- paste("ffreq", levels(meuse$ffreq), sep="")
levels(meuse$soil) <- paste("soil", levels(meuse$soil), sep="")
str(meuse)


###################################################
### code chunk number 4: meuse-zinc-eda-plot-1
###################################################
getOption("SweaveHooks")[["fig"]]()
library(lattice)
palette(trellis.par.get("superpose.symbol")$col)
plot(zinc~dist, meuse, pch=as.integer(ffreq), col=soil)
legend("topright", col=c(rep(1, nlevels(meuse$ffreq)), 1:nlevels(meuse$soil)),
  pch=c(1:nlevels(meuse$ffreq), rep(1, nlevels(meuse$soil))), bty="n",
  legend=c(levels(meuse$ffreq), levels(meuse$soil)))


###################################################
### code chunk number 5: meuse-zinc-eda-plot-2
###################################################
getOption("SweaveHooks")[["fig"]]()
xyplot(log(zinc)~dist | ffreq, meuse, groups=soil, panel=function(x, y, ...){
    panel.xyplot(x, y, ...)
    panel.loess(x, y, ...)
  }, auto.key=TRUE)


###################################################
### code chunk number 6: meuse-zinc-eda-plot-3
###################################################
getOption("SweaveHooks")[["fig"]]()
xyplot(log(zinc)~sqrt(dist) | ffreq, meuse, groups=soil, panel=function(x, y, ...){
    panel.xyplot(x, y, ...)
    panel.loess(x, y, ...)
    panel.lmline(x, y, lty="dashed", ...)
  }, auto.key=TRUE)


###################################################
### code chunk number 7: meuse-zinc-lm
###################################################
r.lm <- lm(log(zinc)~sqrt(dist)+ffreq, meuse)
summary(r.lm)


###################################################
### code chunk number 8: meuse-zinc-lm-resdiag
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(2, 2)); plot(r.lm); par(op)


###################################################
### code chunk number 9: meuse-zinc-lm-res-sv-1
###################################################
getOption("SweaveHooks")[["fig"]]()
library(georob)
plot(sample.variogram(residuals(r.lm), locations=meuse[, c("x","y")],
  lag.dist.def=100, max.lag=2000, xy.angle.def=c(0, 22.5, 67.5, 112.5, 157.5, 180),
  estimator="matheron"), type="l",
  main="sample variogram of residuals log(zinc)~sqrt(dist)+ffreq")


###################################################
### code chunk number 10: meuse-zinc-lm-res-sv-2 (eval = FALSE)
###################################################
getOption("SweaveHooks")[["fig"]]()
## library(georob)
## plot(r.sv <- sample.variogram(residuals(r.lm), locations=meuse[, c("x","y")],
##   lag.dist.def=100, max.lag=2000, 
##   estimator="matheron"), type="l",
##   main="sample variogram of residuals log(zinc)~sqrt(dist)+ffreq")
## lines(r.sv.spher <- fit.variogram.model(r.sv, variogram.mode="RMspheric",
##   param=c(variance=0.1, nugget=0.05, scale=1000), method="BFGS"))


###################################################
### code chunk number 11: meuse-zinc-lm-res-sv-2
###################################################
getOption("SweaveHooks")[["fig"]]()
library(georob)
plot(r.sv, type="l", main="sample variogram of residuals log(zinc)~sqrt(dist)+ffreq")
lines(r.sv.spher)


###################################################
### code chunk number 12: meuse-zinc-lm-res-spher
###################################################
summary(r.sv.spher)


###################################################
### code chunk number 13: meuse-zinc-georob-reml
###################################################
r.georob.m0.spher.reml <- georob(log(zinc)~sqrt(dist)+ffreq, meuse, locations=~x+y,
  variogram.model="RMspheric", param=c(variance=0.1, nugget=0.05, scale=1000), 
  tuning.psi=1000)


###################################################
### code chunk number 14: meuse-zinc-summary-georob-reml
###################################################
summary(r.georob.m0.spher.reml)


###################################################
### code chunk number 15: meuse-zinc-proflik-reml-scale-1a (eval = FALSE)
###################################################
## r.prfl.m0.spher.reml.scale <- profilelogLik(r.georob.m0.spher.reml,
##   values=data.frame(scale=seq(500, 5000, by=50)))


###################################################
### code chunk number 16: meuse-zinc-proflik-reml-scale-1b (eval = FALSE)
###################################################
## r.prfl.m0.spher.reml.scale <- profilelogLik(r.georob.m0.spher.reml,
##   values=data.frame(scale=seq(500, 5000, by=50)), ncores=my.ncores)


###################################################
### code chunk number 17: meuse-zinc-proflik-reml-scale-2
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(loglik~scale, r.prfl.m0.spher.reml.scale, type="l")
abline(v=coef(r.georob.m0.spher.reml, "variogram")["scale"], lty="dashed")
abline(h=r.georob.m0.spher.reml$loglik - 0.5*qchisq(0.95, 1), lty="dotted")


###################################################
### code chunk number 18: meuse-zinc-proflik-reml-scale-3
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(1,2), cex=0.66)
plot(variance~scale, r.prfl.m0.spher.reml.scale, ylim=c(0, max(variance)), type="l")
plot(nugget~scale, r.prfl.m0.spher.reml.scale, ylim=c(0, max(nugget)), type="l")
par(op)


###################################################
### code chunk number 19: meuse-zinc-georob-reml-waldtest-1
###################################################
waldtest(r.georob.m0.spher.reml, .~.-ffreq)


###################################################
### code chunk number 20: meuse-zinc-georob-reml-multcomp
###################################################
library(multcomp)
summary(glht(r.georob.m0.spher.reml, 
  linfct = mcp(ffreq = c("ffreq1 - ffreq2 = 0", "ffreq1 - ffreq3 = 0",
  "ffreq2 - ffreq3 = 0"))))


###################################################
### code chunk number 21: meuse-zinc-georob-reml-waldtest-2
###################################################
waldtest(r.georob.m0.spher.reml, .~.+sqrt(dist):ffreq)


###################################################
### code chunk number 22: meuse-zinc-georob-reml-waldtest-3
###################################################
waldtest(r.georob.m0.spher.reml, .~.+soil)


###################################################
### code chunk number 23: meuse-zinc-georob-reml-step-1 (eval = FALSE)
###################################################
## step(r.georob.m0.spher.reml, scope=log(zinc)~ffreq*sqrt(dist)+soil)


###################################################
### code chunk number 24: meuse-zinc-georob-reml-step-2 (eval = FALSE)
###################################################
## step(r.georob.m0.spher.reml, scope=log(zinc)~ffreq*sqrt(dist)+soil, 
##   fixed.add1.drop1=FALSE)


###################################################
### code chunk number 25: meuse-zinc-georob-ml
###################################################
r.georob.m0.spher.ml <- update(r.georob.m0.spher.reml, 
  control=control.georob(ml.method="ML"))


###################################################
### code chunk number 26: meuse-zinc-georob-aic
###################################################
extractAIC(r.georob.m0.spher.reml, REML=TRUE)
extractAIC(r.georob.m0.spher.ml)
r.georob.m0.spher.ml


###################################################
### code chunk number 27: meuse-zinc-cv-1 (eval = FALSE)
###################################################
## r.cv.m0.spher.reml <- cv(r.georob.m0.spher.reml, seed=3245, lgn=TRUE)
## r.georob.m1.spher.reml <- update(r.georob.m0.spher.reml, .~.-ffreq)
## r.cv.m1.spher.reml <- cv(r.georob.m1.spher.reml, seed=3245, lgn=TRUE)


###################################################
### code chunk number 28: meuse-zinc-cv-2 (eval = FALSE)
###################################################
## r.cv.m0.spher.reml <- cv(r.georob.m0.spher.reml, seed=3245, lgn=TRUE, ncores=my.ncores)
## r.georob.m1.spher.reml <- update(r.georob.m0.spher.reml, .~.-ffreq)
## r.cv.m1.spher.reml <- cv(r.georob.m1.spher.reml, seed=3245, lgn=TRUE, ncores=my.ncores)


###################################################
### code chunk number 29: meuse-zinc-cv-summary
###################################################
summary(r.cv.m0.spher.reml)
summary(r.cv.m1.spher.reml)


###################################################
### code chunk number 30: meuse-zinc-cv-plot
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(3,2))
plot(r.cv.m1.spher.reml, "sc")
plot(r.cv.m0.spher.reml, "sc", add=TRUE, col=2) 
abline(0, 1, lty="dotted")
legend("topleft", pch=1, col=1:2, bty="n", 
  legend=c("log(zinc)~sqrt(dist)", "log(zinc)~sqrt(dist)+ffreq"))
plot(r.cv.m1.spher.reml, "lgn.sc"); plot(r.cv.m0.spher.reml, "lgn.sc", add=TRUE, col=2) 
abline(0, 1, lty="dotted")
plot(r.cv.m1.spher.reml, "hist.pit")
plot(r.cv.m0.spher.reml, "hist.pit", col=2) 
plot(r.cv.m1.spher.reml, "ecdf.pit")
plot(r.cv.m0.spher.reml, "ecdf.pit", add=TRUE, col=2)
abline(0, 1, lty="dotted")
plot(r.cv.m1.spher.reml, "bs")
plot(r.cv.m0.spher.reml, add=TRUE, "bs", col=2) 
par(op)


###################################################
### code chunk number 31: meuse-zinc-georob-plot
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(2,2), cex=0.66)
plot(r.georob.m0.spher.reml, "ta"); abline(h=0, lty="dotted")
plot(r.georob.m0.spher.reml, "qq.res"); abline(0, 1, lty="dotted")
plot(r.georob.m0.spher.reml, "qq.ranef"); abline(0, 1, lty="dotted")
plot(r.georob.m0.spher.reml, lag.dist.def=100, max.lag=2000)
lines(r.georob.m0.spher.ml, col=2); lines(r.sv.spher, col=3)
par(op)


###################################################
### code chunk number 32: meuse-zinc-meuse-grid
###################################################
data(meuse.grid)
levels(meuse.grid$ffreq) <- paste("ffreq", levels(meuse.grid$ffreq), sep="")
levels(meuse.grid$soil) <- paste("soil", levels(meuse.grid$soil), sep="")
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE


###################################################
### code chunk number 33: meuse-zinc-meuse-point-Kriging
###################################################
r.pk <- predict(r.georob.m0.spher.reml, newdata=meuse.grid,
  control=control.predict.georob(extended.output=TRUE))
r.pk <- lgnpp(r.pk)


###################################################
### code chunk number 34: meuse-zinc-meuse-point-Kriging-lgn
###################################################
str(r.pk)


###################################################
### code chunk number 35: meuse-zinc-point-Kriging-plot
###################################################
getOption("SweaveHooks")[["fig"]]()
brks <- c(25, 50, 75, 100, 150, 200, seq(500, 3500,by=500))
pred <- spplot(r.pk, zcol="lgn.pred", at=brks, main="prediction")
lwr <- spplot(r.pk, zcol="lgn.lower", at=brks, main="lower bound 95% PI")
upr <- spplot(r.pk, zcol="lgn.upper", at=brks, main="upper bound 95% PI")
plot(pred, position=c(0, 0, 1/3, 1), more=TRUE)
plot(lwr, position=c(1/3, 0, 2/3, 1), more=TRUE)
plot(upr, position=c(2/3, 0, 1, 1), more=FALSE)


###################################################
### code chunk number 36: meuse-zinc-block-Kriging
###################################################
data(meuse.blocks, package="constrainedKriging")
str(meuse.blocks, max=2)


###################################################
### code chunk number 37: meuse-zinc-meuse-block-Kriging-1a (eval = FALSE)
###################################################
## r.bk <- predict(r.georob.m1.spher.reml, newdata=meuse.blocks,
##   control=control.predict.georob(extended.output=TRUE, pwidth=25, pheight=25, mmax=25))


###################################################
### code chunk number 38: meuse-zinc-meuse-block-Kriging-1b (eval = FALSE)
###################################################
## r.bk <- predict(r.georob.m1.spher.reml, newdata=meuse.blocks,
##   control=control.predict.georob(extended.output=TRUE, pwidth=25, pheight=25))


###################################################
### code chunk number 39: meuse-zinc-meuse-block-Kriging-2 (eval = FALSE)
###################################################
## r.bk <- lgnpp(r.bk, newdata=meuse.grid)


###################################################
### code chunk number 40: meuse-zinc-block-Kriging-plot
###################################################
getOption("SweaveHooks")[["fig"]]()
brks <- c(25, 50, 75, 100, 150, 200, seq(500, 3500,by=500))
pred <- spplot(r.bk, zcol="lgn.pred", at=brks, main="prediction")
lwr <- spplot(r.bk, zcol="lgn.lower", at=brks, main="lower bound 95% PI")
upr <- spplot(r.bk, zcol="lgn.upper", at=brks, main="upper bound 95% PI")
plot(pred, position=c(0, 0, 1/3, 1), more=TRUE)
plot(lwr, position=c(1/3, 0, 2/3, 1), more=TRUE)
plot(upr, position=c(2/3, 0, 1, 1), more=FALSE)


###################################################
### code chunk number 41: meuse-zinc-block-Kriging-blocks
###################################################
getOption("SweaveHooks")[["fig"]]()
## define blocks
tmp <- data.frame(x=c(179100, 179900), y=c(330200, 331000))
blks <- SpatialPolygons(sapply(1:nrow(tmp), function(i, x){  
  Polygons(list(Polygon(t(x[,i] + 400*t(cbind(c(-1, 1, 1, -1, -1), c(-1, -1, 1, 1, -1)))),
  hole=FALSE)), ID=paste("block", i, sep=""))}, x=t(tmp)))
## compute spatial mean of sqrt(dist) for blocks
ind <- over(as(meuse.grid, "SpatialPoints"), blks)
tmp <- tapply(sqrt(meuse.grid$dist), ind, mean)
names(tmp) <- paste("block", 1:length(tmp), sep="")
## create SpatialPolygonsDataFrame
blks <- SpatialPolygonsDataFrame(blks, data=data.frame(dist=tmp^2))
## and plot
plot(as(meuse.grid, "SpatialPoints"), axes=TRUE)
plot(geometry(blks), add=TRUE, col=2)


###################################################
### code chunk number 42: meuse-zinc-block-Kriging-3 (eval = FALSE)
###################################################
## r.blks <- predict(r.georob.m1.spher.reml, newdata=blks, 
##   control=control.predict.georob(extended.output=TRUE, pwidth=800, pheight=800))
## r.blks <- lgnpp(r.blks, newdata=meuse.grid)


###################################################
### code chunk number 43: <meuse-zinc-block-Kriging-4a (eval = FALSE)
###################################################
## t.pk <- predict(r.georob.m0.spher.reml, newdata=as.data.frame(meuse.grid),
##   control=control.predict.georob(extended.output=TRUE, full.covmat=TRUE))
## str(t.pk)


###################################################
### code chunk number 44: meuse-zinc-block-Kriging-5 (eval = FALSE)
###################################################
## ## index defining to which block the points predictions belong
## ind <- over(geometry(meuse.grid), geometry(blks))
## ind <- tapply(1:nrow(meuse.grid), factor(ind), function(x) x)
## ## select point predictions in block and predict block average
## tmp <- t(sapply(ind, function(i, x){
##   x$pred <- x$pred[i,]
##   x$mse.pred <- x$mse.pred[i,i]
##   x$var.pred <- x$var.pred[i,i]
##   x$cov.pred.target <- x$cov.pred.target[i,i]
##   x$var.target <- x$var.target[i,i]
##   res <- lgnpp(x, is.block=TRUE)
##   res
##   }, x=t.pk))
## colnames(tmp) <- c("opt.pred", "opt.se")
## r.blks <- cbind( r.blks, tmp)


###################################################
### code chunk number 45: meuse-zinc-block-Kriging-6
###################################################
r.blks@data[, c("lgn.pred", "opt.pred", "lgn.se", "opt.se")]


###################################################
### code chunk number 46: meuse-zinc-cleanup-1
###################################################
palette("default")


###################################################
### code chunk number 47: meuse-zinc-cleanup-2 (eval = FALSE)
###################################################
## # save(list=ls(pattern="^r\\."), file="r_meuse_zinc_objects.RData")
## save(list=c("r.sv", "r.sv.spher", "r.prfl.m0.spher.reml.scale", "r.cv.m0.spher.reml", 
##     "r.cv.m1.spher.reml", "r.bk", "r.blks"), file="r_meuse_zinc_objects.RData")
## rm(list=ls(pattern="^r\\."))


###################################################
### code chunk number 48: ash-load
###################################################
if(file.exists("r_coalash_objects.RData")) load("r_coalash_objects.RData")


###################################################
### code chunk number 49: ash-data
###################################################
data(coalash, package="gstat")
summary(coalash)


###################################################
### code chunk number 50: ash-centred-bubbleplot1
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(y~x, coalash, cex=sqrt(abs(coalash - median(coalash))), 
  col=c("blue", NA, "red")[sign(coalash - median(coalash))+2], asp=1,
  main="coalash - median(coalash)", ylab="northing", xlab="easting")
points(y~x, coalash, subset=c(15, 50, 63, 73, 88, 111), pch=4); grid()
legend("topleft", pch=1, col=c("blue", "red"), legend=c("< 0", "> 0"), bty="n")


###################################################
### code chunk number 51: ash-coords-scatterplot
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(1,2))
with(coalash, scatter.smooth(x, coalash, main="coalash ~ x"))
with(coalash, scatter.smooth(y, coalash, main="coalash ~ y"))
par(op)


###################################################
### code chunk number 52: ash-centerd-qqnorm
###################################################
getOption("SweaveHooks")[["fig"]]()
qqnorm(coalash$coalash)


###################################################
### code chunk number 53: ash-lmrob
###################################################
library(robustbase)
r.lmrob <- lmrob(coalash~x+y, coalash)
summary(r.lmrob)


###################################################
### code chunk number 54: ash-diag-lmrob
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(2,2))
plot(r.lmrob, which=c(1:2, 4:5))
par(op)


###################################################
### code chunk number 55: ash-sv-res-lmrob-iso
###################################################
getOption("SweaveHooks")[["fig"]]()
library(georob)
plot(sample.variogram(residuals(r.lmrob), locations=coalash[, c("x","y")],
  lag.dist.def=1, max.lag=10, estimator="matheron"), pch=1, col="black",
  main="sample variogram of residuals coalash~x+y")
plot(sample.variogram(residuals(r.lmrob), locations=coalash[, c("x","y")],
  lag.dist.def=1, estimator="qn"), pch=2, col="blue", add=TRUE)
plot(sample.variogram(residuals(r.lmrob), locations=coalash[, c("x","y")],
  lag.dist.def=1, estimator="ch"), pch=3, col="cyan", add=TRUE)
plot(sample.variogram(residuals(r.lmrob), locations=coalash[, c("x","y")],
  lag.dist.def=1, estimator="mad"), pch=4, col="orange", add=TRUE)
legend("bottomright", pch=1:4, col=c("black", "blue", "cyan", "orange"),
  legend=paste(c("method-of-moments", "Qn", "Cressie-Hawkins", "MAD"), 
  "estimator"), bty="n")


###################################################
### code chunk number 56: ash-sv-res-lmrob-aniso
###################################################
getOption("SweaveHooks")[["fig"]]()
r.sv <- sample.variogram(residuals(r.lmrob), locations=coalash[, c("x","y")],
  lag.dist.def=1, max.lag=10, xy.angle.def=c(-0.1, 0.1, 89.9, 90.1),
  estimator="qn")
plot(gamma~lag.dist, r.sv, subset=lag.x < 1.e-6, xlim=c(0, 10), ylim=c(0, 1.4),
  pch=1, col="blue", 
  main="directional sample variogram of residuals (Qn-estimator)")
points(gamma~lag.dist, r.sv, subset=lag.y < 1.e-6, pch=3, col="orange")
legend("bottomright", pch=c(1, 3), col=c("blue", "orange"), 
  legend=c("N-S direction", "W-E direction"), bty="n")


###################################################
### code chunk number 57: ash-georob-robust-1
###################################################
r.georob.m0.exp.c2 <- georob(coalash~x+y, coalash, locations=~x+y, 
  variogram.model="RMexp", param=c(variance=0.1, nugget=0.9, scale=1))


###################################################
### code chunk number 58: ash-summary-georob-robust-1
###################################################
summary(r.georob.m0.exp.c2)


###################################################
### code chunk number 59: ash-waldtest-quadratic-robust
###################################################
waldtest(update(r.georob.m0.exp.c2, .~.+I(x^2)+I(y^2)+I(x*y)), r.georob.m0.exp.c2)


###################################################
### code chunk number 60: ash-georob-robust-2
###################################################
r.georob.m1.exp.c2 <- update(r.georob.m0.exp.c2, .~.-y)


###################################################
### code chunk number 61: ash-summary-georob-robust-2
###################################################
r.georob.m1.exp.c2


###################################################
### code chunk number 62: ash-georob-robust-3
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(r.georob.m1.exp.c2, lag.dist.def=1, max.lag=10, estimator="qn", col="blue")


###################################################
### code chunk number 63: ash-diag-georob-robust-2-1
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(2,2))
plot(r.georob.m1.exp.c2, what="ta")
plot(r.georob.m1.exp.c2, what="sl")
plot(r.georob.m1.exp.c2, what="qq.res"); abline(0, 1, lty="dotted")
plot(r.georob.m1.exp.c2, what="qq.ranef"); abline(0, 1, lty="dotted")
par(op)


###################################################
### code chunk number 64: ash-rw-georob-robust-2-1
###################################################
round(cbind(coalash[, c("x", "y")], 
  rweights=r.georob.m1.exp.c2[["rweights"]])[c(15, 50, 63, 73, 88, 111, 192),],
  2)


###################################################
### code chunk number 65: ash-rw-georob-robust-2-1
###################################################
sel <- r.georob.m1.exp.c2[["rweights"]] <= 0.8 & 
  !1:nrow(coalash) %in% c(15, 50, 63, 73, 88, 111, 192)
round(cbind(coalash[, c("x", "y")], 
  rweights=r.georob.m1.exp.c2[["rweights"]])[sel,],
  2)


###################################################
### code chunk number 66: ash-diag-georob-robust-2-2
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(y~x, coalash, cex=sqrt(abs(residuals(r.georob.m1.exp.c2))), 
  col=c("blue", NA, "red")[sign(residuals(r.georob.m1.exp.c2))+2], asp=1,
  main="estimated errors robust REML", xlab="northing", ylab="easting")
points(y~x, coalash, subset=r.georob.m1.exp.c2[["rweights"]]<=0.8, pch=4); grid()
legend("topleft", pch=1, col=c("blue", "red"), legend=c("< 0", "> 0"), bty="n")


###################################################
### code chunk number 67: ash-georob-gaussian-1
###################################################
r.georob.m1.exp.c1000 <- update(r.georob.m1.exp.c2, tuning.psi=1000)


###################################################
### code chunk number 68: ash-georob-summary-gaussian-1
###################################################
summary(r.georob.m1.exp.c1000)


###################################################
### code chunk number 69: ash-georob-gaussian-2
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(r.georob.m1.exp.c1000, lag.dist.def=1, max.lag=10, estimator="matheron")
plot(r.georob.m1.exp.c2, lag.dist.def=1, max.lag=10, estimator="qn", add = TRUE, 
  col="blue")
plot(update(r.georob.m1.exp.c2, subset=-50), lag.dist.def=1, max.lag=10, estimator="qn", 
  add = TRUE, col="orange")
legend("bottomright", lt=1, col=c("black","blue", "orange"), 
  legend =c("Gaussian REML", "robust REML", "Gaussian REML without outlier (5,6)" ), bty="n")


###################################################
### code chunk number 70: ash-georob-diag-gaussian-robust-2
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(1,2), cex=5/6)
plot(residuals(r.georob.m1.exp.c2), residuals(r.georob.m1.exp.c1000), 
  asp = 1, main=expression(paste("Gaussian vs robust ", widehat(epsilon))),
  xlab=expression(paste("robust ", widehat(epsilon))), 
  ylab=expression(paste("Gaussian ", widehat(epsilon))))
abline(0, 1, lty="dotted")
plot(ranef(r.georob.m1.exp.c2), ranef(r.georob.m1.exp.c1000), 
  asp = 1, main=expression(paste("Gaussian vs robust ", italic(widehat(B)))),
  xlab=expression(paste("robust ", italic(widehat(B)))), 
  ylab=expression(paste("Gaussian ", italic(widehat(B)))))
abline(0, 1, lty="dotted")


###################################################
### code chunk number 71: ash-cv-georob-gaussian-robust-1 (eval = FALSE)
###################################################
## r.cv.georob.m1.exp.c2 <- cv(r.georob.m1.exp.c2, seed=1,
##   control=control.georob(initial.param=FALSE))
## r.cv.georob.m1.exp.c1000 <- cv(r.georob.m1.exp.c1000, seed=1)


###################################################
### code chunk number 72: ash-cv-georob-gaussian-robust-2 (eval = FALSE)
###################################################
## r.cv.georob.m1.exp.c2 <- cv(r.georob.m1.exp.c2, seed=1, 
##   control=control.georob(initial.param=FALSE), ncores=my.ncores)
## r.cv.georob.m1.exp.c1000 <- cv(r.georob.m1.exp.c1000, seed=1, ncores=my.ncores)


###################################################
### code chunk number 73: ash-cv-georob-subsets
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(y~x, r.cv.georob.m1.exp.c2$pred, asp=1, col=subset, pch=as.integer(subset))


###################################################
### code chunk number 74: ash-summary-cv-georob-gaussian-robust
###################################################
summary(r.cv.georob.m1.exp.c1000, se=TRUE)
summary(r.cv.georob.m1.exp.c2, se=TRUE)


###################################################
### code chunk number 75: ash-diag-cv-georob-gaussian-robust
###################################################
getOption("SweaveHooks")[["fig"]]()
op <- par(mfrow=c(3, 2))
plot(r.cv.georob.m1.exp.c2, type="ta", col="blue")
plot(r.cv.georob.m1.exp.c1000, type="ta", col="orange", add=TRUE)
abline(h=0, lty="dotted")
legend("topleft", pch=1, col=c("orange", "blue"), legend=c("Gaussian", "robust"), bty="n")
plot(r.cv.georob.m1.exp.c2, type="qq", col="blue")
plot(r.cv.georob.m1.exp.c1000, type="qq", col="orange", add=TRUE)
abline(0, 1, lty="dotted")
legend("topleft", lty=1, col=c("orange", "blue"), legend=c("Gaussian", "robust"), bty="n")
plot(r.cv.georob.m1.exp.c2, type="ecdf.pit", col="blue", do.points=FALSE)
plot(r.cv.georob.m1.exp.c1000, type="ecdf.pit", col="orange", add=TRUE, do.points=FALSE)
abline(0, 1, lty="dotted")
legend("topleft", lty=1, col=c("orange", "blue"), legend=c("Gaussian", "robust"), bty="n")
plot(r.cv.georob.m1.exp.c2, type="bs", col="blue")
plot(r.cv.georob.m1.exp.c1000, type="bs", col="orange", add=TRUE)
legend("topright", lty=1, col=c("orange", "blue"), legend=c("Gaussian", "robust"), bty="n")
plot(r.cv.georob.m1.exp.c1000, type="mc", main="Gaussian REML")
plot(r.cv.georob.m1.exp.c2, type="mc", main="robust REML")
par(op)


###################################################
### code chunk number 76: ash-Kriging-grid
###################################################
coalash.grid <- expand.grid(x=seq(-1, 17, by=0.2),
  y=seq( -1, 24, by=0.2))
coordinates( coalash.grid) <- ~x+y  # convert to SpatialPoints
gridded( coalash.grid) <- TRUE      # convert to SpatialPixels
fullgrid( coalash.grid) <- TRUE     # convert to SpatialGrid
str(coalash.grid, max=2)


###################################################
### code chunk number 77: ash-pKriging-1 (eval = FALSE)
###################################################
## r.pk.m1.exp.c2 <- predict(r.georob.m1.exp.c2, newdata=coalash.grid)
## r.pk.m1.exp.c1000 <- predict(r.georob.m1.exp.c1000, newdata=coalash.grid)


###################################################
### code chunk number 78: ash-pKriging-2 (eval = FALSE)
###################################################
## r.pk.m1.exp.c2 <- predict(r.georob.m1.exp.c2, newdata=coalash.grid, control=control.predict.georob(ncores=my.ncores))
## r.pk.m1.exp.c1000 <- predict(r.georob.m1.exp.c1000, newdata=coalash.grid, control=control.predict.georob(ncores=my.ncores))


###################################################
### code chunk number 79: ash-pKriging-plot-robust-gaussian-1
###################################################
getOption("SweaveHooks")[["fig"]]()
pred.rob <- spplot(r.pk.m1.exp.c2, "pred", at=seq(8, 12, by=0.25), 
  main="robust Kriging prediction", scales=list(draw=TRUE))
pred.gauss <- spplot(r.pk.m1.exp.c1000, "pred", at=seq(8, 12, by=0.25), 
  main="Gaussian Kriging prediction", scales=list(draw=TRUE))
se.rob <- spplot(r.pk.m1.exp.c2, "se", at=seq(0.35, 0.65, by=0.025), 
  main="standard error robust Kriging", scales=list(draw=TRUE))
se.gauss <- spplot(r.pk.m1.exp.c1000, "se", at=seq(0.35, 0.65, by=0.025), 
  main="standard error Gaussian Kriging", scales=list(draw=TRUE))
plot(pred.rob, pos=c(0, 0.5, 0.5, 1), more=TRUE)
plot(pred.gauss, pos=c(0.5, 0.5, 1, 1), more=TRUE)
plot(se.rob, pos=c(0, 0, 0.5, 0.5), more=TRUE)
plot(se.gauss, pos=c(0.5, 0, 1, 0.5), more=FALSE)


###################################################
### code chunk number 80: ash-pKriging-plot-robust-gaussian-2
###################################################
getOption("SweaveHooks")[["fig"]]()
library(lattice)
# rel. difference of predictions
r.pk.m1.exp.c2$reldiff.pred <- (r.pk.m1.exp.c1000$pred -
  r.pk.m1.exp.c2$pred) / r.pk.m1.exp.c2$pred * 100
reldiff.pred <- spplot(r.pk.m1.exp.c2, "reldiff.pred", at=-1:7, 
  main="Gaussian - robust Kriging predictions", scales=list(draw=TRUE))
# ratio Kriging variances
r.pk.m1.exp.c2$ratio.msep <- r.pk.m1.exp.c1000$se^2 / 
  r.pk.m1.exp.c2$se^2 * 100
ratio.msep <- spplot(r.pk.m1.exp.c2, "ratio.msep",  at=105:115, 
  main="ratio of Gaussian to robust Kriging variances",scales=list(draw=TRUE))
plot(reldiff.pred, pos=c(0, 0, 0.5, 1), more=TRUE)
#  add bubble plot of centred data colored by "robustness" weights
rw <- cut(r.georob.m1.exp.c2$rweights, seq(0.2, 1, by = 0.2))
trellis.focus("panel", 1, 1)
panel.points(coalash$x, coalash$y, lwd=2, 
  cex=sqrt(abs(coalash$coalash - median((coalash$coalash)))), 
  col=colorRampPalette(c("yellow", "orange", grey(0.4)))(4)[as.numeric(rw)])
panel.text(rep(17, nlevels(rw)+1), 0:nlevels(rw), pos=2, cex=0.8, 
  labels=c(rev(levels(rw)), "rob. weights"), 
  col=c(rev(colorRampPalette(c("yellow", "orange", grey(0.4)))(4)), "white"))
trellis.unfocus()

plot(ratio.msep, pos=c(0.5, 0, 1, 1), more=FALSE)


###################################################
### code chunk number 81: ash-Kriging-polygons
###################################################
getOption("SweaveHooks")[["fig"]]()
tmp <- expand.grid(x = seq(2.5, 16.5, by=4), y=seq(2, 22, by=4))
rownames(tmp) <- paste("block", rownames(tmp), sep="")
# create SpatialPolygonsDataFrame
coalash.polygons <- sapply(1:nrow(tmp), function(i, x){  
  Polygons(list(Polygon(
        t(x[,i] + t(cbind(c(-2, 2, 2, -2, -2), c(-2, -2, 2, 2, -2)))),
        hole=FALSE)), ID=paste("block", i, sep=""))},
  x=t(tmp))
coalash.polygons <- SpatialPolygonsDataFrame(SpatialPolygons(coalash.polygons), 
  data = tmp)
summary(coalash.polygons)
plot(coalash.polygons, col="grey", axes=TRUE); points(y~x, coalash)


###################################################
### code chunk number 82: ash-bKriging-1 (eval = FALSE)
###################################################
## r.bk.m1.exp.c2 <- predict(r.georob.m1.exp.c2, newdata=coalash.polygons,
##   control=control.predict.georob(pwidth=4, pheight=4, full.covmat=TRUE))
## r.bk.m1.exp.c1000 <- predict(r.georob.m1.exp.c1000, newdata=coalash.polygons,
##   control=control.predict.georob(pwidth=4, pheight=4, full.covmat=TRUE))


###################################################
### code chunk number 83: ash-str-bKriging
###################################################
str(r.bk.m1.exp.c2, max=2)


###################################################
### code chunk number 84: ash-gKriging
###################################################
c(pred=mean(r.bk.m1.exp.c2$pred$pred),
  se=sqrt(sum(r.bk.m1.exp.c2$mse.pred))/24)


###################################################
### code chunk number 85: ash-bKriging-2
###################################################
coalash.domain <- rbind(c(0.5,0), c(16.5,0), c(16.5,24), c(0.5,24), c(0.5,0))
coalash.domain <- SpatialPolygonsDataFrame(
  SpatialPolygons(list(Polygons(list(Polygon(coalash.domain)), ID= "domain"))), 
  data=data.frame(x=8.5,y=12,row.names="domain"))
slot(predict(r.georob.m1.exp.c2, newdata=coalash.domain,
  control=control.predict.georob(pwidth=16, pheight=24)), "data")


###################################################
### code chunk number 86: ash-bKriging-plot-robust-gaussian-1
###################################################
getOption("SweaveHooks")[["fig"]]()
pred.rob <- spplot(r.bk.m1.exp.c2$pred, "pred", at=seq(8, 11, by=0.25), 
  main="robust Kriging prediction", scales=list(draw=TRUE))
pred.gauss <- spplot(r.bk.m1.exp.c1000$pred, "pred", at=seq(8, 11, by=0.25), 
  main="Gaussian Kriging prediction", scales=list(draw=TRUE))
se.rob <- spplot(r.bk.m1.exp.c2$pred, "se", at=seq(0.15, 0.45, by=0.025), 
  main="standard error robust Kriging", scales=list(draw=TRUE))
se.gauss <- spplot(r.bk.m1.exp.c1000$pred, "se", at=seq(0.15, 0.45, by=0.025), 
  main="standard error Gaussian Kriging", scales=list(draw=TRUE))
plot(pred.rob, pos=c(0, 0.5, 0.5, 1), more=TRUE)
plot(pred.gauss, pos=c(0.5, 0.5, 1, 1), more=TRUE)
plot(se.rob, pos=c(0, 0, 0.5, 0.5), more=TRUE)
plot(se.gauss, pos=c(0.5, 0, 1, 0.5), more=FALSE)


###################################################
### code chunk number 87: ash-results-save-1 (eval = FALSE)
###################################################
## # save(list=ls(pattern="^r\\."), file="r_coalash_objects.RData")
## save(list=c(
##     "r.cv.georob.m1.exp.c2", "r.cv.georob.m1.exp.c1000", 
##     "r.pk.m1.exp.c2", "r.pk.m1.exp.c1000", "r.bk.m1.exp.c2", "r.bk.m1.exp.c1000"
##   ), file="r_coalash_objects.RData")
## rm(list=ls(pattern="^r\\."))


