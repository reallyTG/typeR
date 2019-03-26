library(spgwr)


### Name: gw.cov
### Title: Geographically weighted local statistics
### Aliases: gw.cov
### Keywords: spatial

### ** Examples

## No test: 
data(georgia)
SRgwls <- gw.cov(gSRDF, vars=6:11, bw=2, longlat=FALSE)
names(SRgwls$SDF)
spplot(SRgwls$SDF, "mean.PctPov")
spplot(SRgwls$SDF, "sd.PctPov")
spplot(SRgwls$SDF, "sem.PctPov")
spplot(SRgwls$SDF, "diff.PctPov")
spplot(SRgwls$SDF, "cor.PctPov.PctBlack.")
SRgwls <- gw.cov(gSRDF, vars=6:11, bw=150, longlat=TRUE)
names(SRgwls$SDF)
spplot(SRgwls$SDF, "mean.PctPov")
spplot(SRgwls$SDF, "sd.PctPov")
spplot(SRgwls$SDF, "sem.PctPov")
spplot(SRgwls$SDF, "diff.PctPov")
spplot(SRgwls$SDF, "cor.PctPov.PctBlack.")
data(gSRouter)
#gGrid <- sample.Polygons(slot(gSRouter, "polygons")[[1]], 5000,
gGrid <- spsample(slot(gSRouter, "polygons")[[1]], 5000,
  type="regular")
gridded(gGrid) <- TRUE
SGgwls <- gw.cov(gSRDF, vars=6:11, fp=gGrid, bw=150, longlat=TRUE)
names(SGgwls$SDF)
spplot(SGgwls$SDF, "mean.PctPov")
spplot(SGgwls$SDF, "sd.PctPov")
spplot(SGgwls$SDF, "sem.PctPov")
spplot(SGgwls$SDF, "diff.PctPov")
spplot(SGgwls$SDF, "cor.PctPov.PctBlack.")
## End(No test)
set.seed(1)
pts <- data.frame(x=runif(100, 0, 5), y=runif(100, 0, 5), z=rnorm(100))
coordinates(pts) <- c("x", "y")
proj4string(pts) <- CRS("+proj=longlat +ellps=WGS84")
fps <- SpatialPoints(cbind(x=runif(100, 0, 5), y=runif(100, 0, 5)),
 proj4string=CRS("+proj=longlat +ellps=WGS84"))
t0 <- gw.cov(pts, "z", fp=fps, adapt=0.2, longlat=TRUE)



