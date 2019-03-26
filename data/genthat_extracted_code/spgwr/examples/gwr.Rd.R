library(spgwr)


### Name: gwr
### Title: Geographically weighted regression
### Aliases: gwr print.gwr
### Keywords: spatial

### ** Examples

data(columbus, package="spData")
col.lm <- lm(CRIME ~ INC + HOVAL, data=columbus)
summary(col.lm)
col.bw <- gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y))
col.gauss <- gwr(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y), bandwidth=col.bw, hatmatrix=TRUE)
col.gauss
col.d <- gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y), gweight=gwr.bisquare)
col.bisq <- gwr(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y), bandwidth=col.d, 
  gweight=gwr.bisquare, hatmatrix=TRUE)
col.bisq
data(georgia)
g.adapt.gauss <- gwr.sel(PctBach ~ TotPop90 + PctRural + PctEld + PctFB + 
 PctPov + PctBlack, data=gSRDF, adapt=TRUE)
res.adpt <- gwr(PctBach ~ TotPop90 + PctRural + PctEld + PctFB + PctPov + 
 PctBlack, data=gSRDF, adapt=g.adapt.gauss)
res.adpt
pairs(as(res.adpt$SDF, "data.frame")[,2:8], pch=".")
brks <- c(-0.25, 0, 0.01, 0.025, 0.075)
cols <- grey(5:2/6)
plot(res.adpt$SDF, col=cols[findInterval(res.adpt$SDF$PctBlack, brks,
 all.inside=TRUE)])
## No test: 
# simulation scenario with patterned dependent variable
set.seed(1)
X0 <- runif(nrow(gSRDF)*3)
X1 <- matrix(sample(X0), ncol=3)
X1 <- prcomp(X1, center=FALSE, scale.=FALSE)$x
gSRDF$X1 <- X1[,1]
gSRDF$X2 <- X1[,2]
gSRDF$X3 <- X1[,3]
bw <- gwr.sel(PctBach ~ X1 + X2 + X3, data=gSRDF, verbose=FALSE)
out <- gwr(PctBach ~ X1 + X2 + X3, data=gSRDF, bandwidth=bw, hatmatrix=TRUE)
out
spplot(gSRDF, "PctBach", col.regions=grey.colors(20))
spplot(gSRDF, c("X1", "X2", "X3"), col.regions=grey.colors(20))
# pattern in the local coefficients
spplot(out$SDF, c("X1", "X2", "X3"), col.regions=grey.colors(20))
# but no "significant" pattern
spplot(out$SDF, c("X1_se", "X2_se", "X3_se"), col.regions=grey.colors(20))
out$SDF$X1_t <- out$SDF$X1/out$SDF$X1_se
out$SDF$X2_t <- out$SDF$X2/out$SDF$X2_se
out$SDF$X3_t <- out$SDF$X3/out$SDF$X3_se
spplot(out$SDF, c("X1_t", "X2_t", "X3_t"), col.regions=grey.colors(20))
# simulation scenario with random dependent variable
yrn <- rnorm(nrow(gSRDF))
gSRDF$yrn <- sample(yrn)
bw <- gwr.sel(yrn ~ X1 + X2 + X3, data=gSRDF, verbose=FALSE)
# bandwidth selection maxes out at 620 km, equal to upper bound
# of line search
out <- gwr(yrn ~ X1 + X2 + X3, data=gSRDF, bandwidth=bw, hatmatrix=TRUE)
out
spplot(gSRDF, "yrn", col.regions=grey.colors(20))
spplot(gSRDF, c("X1", "X2", "X3"), col.regions=grey.colors(20))
# pattern in the local coefficients
spplot(out$SDF, c("X1", "X2", "X3"), col.regions=grey.colors(20))
# but no "significant" pattern
spplot(out$SDF, c("X1_se", "X2_se", "X3_se"), col.regions=grey.colors(20))
out$SDF$X1_t <- out$SDF$X1/out$SDF$X1_se
out$SDF$X2_t <- out$SDF$X2/out$SDF$X2_se
out$SDF$X3_t <- out$SDF$X3/out$SDF$X3_se
spplot(out$SDF, c("X1_t", "X2_t", "X3_t"), col.regions=grey.colors(20))
# end of simulations
## End(No test)
## No test: 
data(meuse)
coordinates(meuse) <- c("x", "y")
meuse$ffreq <- factor(meuse$ffreq)
data(meuse.grid)
coordinates(meuse.grid) <- c("x", "y")
meuse.grid$ffreq <- factor(meuse.grid$ffreq)
gridded(meuse.grid) <- TRUE
xx <- gwr(cadmium ~ dist, meuse, bandwidth = 228, hatmatrix=TRUE)
xx
x <- gwr(cadmium ~ dist, meuse, bandwidth = 228, fit.points = meuse.grid,
 predict=TRUE, se.fit=TRUE, fittedGWRobject=xx)
x
spplot(x$SDF, "pred")
spplot(x$SDF, "pred.se")
## End(No test)
## Not run: 
##D   g.bw.gauss <- gwr.sel(PctBach ~ TotPop90 + PctRural + PctEld + PctFB +
##D     PctPov + PctBlack, data=gSRDF)
##D   res.bw <- gwr(PctBach ~ TotPop90 + PctRural + PctEld + PctFB + PctPov +
##D     PctBlack, data=gSRDF, bandwidth=g.bw.gauss)
##D   res.bw
##D   pairs(as(res.bw$SDF, "data.frame")[,2:8], pch=".")
##D   plot(res.bw$SDF, col=cols[findInterval(res.bw$SDF$PctBlack, brks,
##D     all.inside=TRUE)])
##D   g.bw.gauss <- gwr.sel(PctBach ~ TotPop90 + PctRural + PctEld + PctFB +
##D     PctPov + PctBlack, data=gSRDF, longlat=TRUE)
##D   data(gSRouter)
##D   require(maptools)
##D   SG <- GE_SpatialGrid(gSRouter, maxPixels = 100)
##D   SPxMASK0 <- over(SG$SG, gSRouter)
##D   SGDF <- SpatialGridDataFrame(slot(SG$SG, "grid"),
##D     data=data.frame(SPxMASK0=SPxMASK0),
##D     proj4string=CRS(proj4string(gSRouter)))
##D   SPxDF <- as(SGDF, "SpatialPixelsDataFrame")
##D   res.bw <- gwr(PctBach ~ TotPop90 + PctRural + PctEld + PctFB + PctPov +
##D     PctBlack, data=gSRDF, bandwidth=g.bw.gauss, fit.points=SPxDF,
##D     longlat=TRUE)
##D   res.bw
##D   res.bw$timings
##D   spplot(res.bw$SDF, "PctBlack")
##D   require(parallel)
##D   cl <- makeCluster(detectCores())
##D   res.bwc <- gwr(PctBach ~ TotPop90 + PctRural + PctEld + PctFB + PctPov +
##D     PctBlack, data=gSRDF, bandwidth=g.bw.gauss, fit.points=SPxDF,
##D     longlat=TRUE, cl=cl)
##D   res.bwc
##D   res.bwc$timings
##D   stopCluster(cl)
## End(Not run)



