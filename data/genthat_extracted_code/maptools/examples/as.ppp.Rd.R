library(maptools)


### Name: as.ppp
### Title: coercion between sp objects and spatstat objects
### Aliases: as.owin.SpatialGridDataFrame as.owin.SpatialPixelsDataFrame
###   as.owin.SpatialPolygons as.im.SpatialGridDataFrame
###   coerce,SpatialGridDataFrame,owin-method
###   coerce,SpatialPixelsDataFrame,owin-method
###   coerce,SpatialPolygons,owin-method as.SpatialPolygons.tess
###   as.SpatialPolygons.owin coerce,tess,SpatialPolygons-method
###   coerce,owin,SpatialPolygons-method
###   coerce,SpatialGridDataFrame,im-method coerce,RasterLayer,im-method
###   as.ppp.SpatialGridDataFrame as.ppp.SpatialPoints
###   as.ppp.SpatialPointsDataFrame coerce,SpatialPoints,ppp-method
###   coerce,SpatialPointsDataFrame,ppp-method as.psp.Line as.psp.Lines
###   as.psp.SpatialLines as.psp.SpatialLinesDataFrame
###   coerce,Line,psp-method coerce,Lines,psp-method
###   coerce,SpatialLines,psp-method
###   coerce,SpatialLinesDataFrame,psp-method as.SpatialLines.psp
###   coerce,psp,SpatialLines-method coerce,im,SpatialGridDataFrame-method
###   coerce,ppp,SpatialGridDataFrame-method
###   coerce,ppp,SpatialPointsDataFrame-method
###   coerce,ppp,SpatialPoints-method as.SpatialPointsDataFrame.ppp
###   as.SpatialGridDataFrame.ppp as.SpatialPoints.ppp
###   as.SpatialGridDataFrame.im as.im.RasterLayer
### Keywords: spatial

### ** Examples

if (require(spatstat, quietly=TRUE)) {
data(meuse)
coordinates(meuse) = ~x+y
zn1 <- as(meuse["zinc"], "ppp")
zn1
plot(zn1)
as(as(meuse, "SpatialPoints"), "ppp")
data(meuse.grid)
gridded(meuse.grid) = ~x+y
mg_owin <- as(meuse.grid["dist"], "owin")
zn1a <- ppp(x=zn1$x, y=zn1$y, marks=zn1$marks, window=mg_owin)
zn1a
plot(zn1a)
rev_ppp_SP <- as.SpatialPoints.ppp(zn1a)
summary(rev_ppp_SP)
rev_ppp_SPDF <- as.SpatialPointsDataFrame.ppp(zn1a)
summary(rev_ppp_SPDF)
rev_ppp_SGDF <- as.SpatialGridDataFrame.ppp(zn1a)
summary(rev_ppp_SGDF)
data(meuse.riv)
mr <- Line(meuse.riv)
mr_psp <- as(mr, "psp")
mr_psp
plot(mr_psp)
xx_back <- as(mr_psp, "SpatialLines")
plot(xx_back)
xx <- readShapeLines(system.file("shapes/fylk-val.shp", package="maptools")[1],
 proj4string=CRS("+proj=utm +zone=33 +datum=WGS84"))
xx_psp <- as(xx["LENGTH"], "psp")
xx_psp
plot(xx_psp)
xx_back <- as(xx_psp, "SpatialLines")
plot(xx_back)
mg_owin <- as(as(meuse.grid["ffreq"], "SpatialPixelsDataFrame"), "owin")
mg_owin
ho_sp <- SpatialPolygons(list(Polygons(list(Polygon(cbind(c(0,1,1,0,0),
  c(0,0,1,1,0))), Polygon(cbind(c(0.6,0.4,0.4,0.6,0.6), 
  c(0.2,0.2,0.4,0.4,0.2)), hole=TRUE)), ID="ho")))
plot(ho_sp, col="red", pbg="pink")
ho <- as(ho_sp, "owin")
plot(ho)
pp <- runifpoint(500, win=ho)
plot(pp)
ho_orig <- owin(poly=list(list(x=c(0,1,1,0), y=c(0,0,1,1)),
  list(x=c(0.6,0.4,0.4,0.6), y=c(0.2,0.2,0.4,0.4))))
identical(ho, ho_orig)
ho_sp1 <- as(ho, "SpatialPolygons")
all.equal(ho_sp, ho_sp1, check.attributes=FALSE)
A <- tess(xgrid=0:4,ygrid=0:4)
A_sp <- as(A, "SpatialPolygons")
plot(A_sp)
text(coordinates(A_sp), labels=row.names(A_sp), cex=0.6)
mg_dist <- meuse.grid["dist"]
fullgrid(mg_dist) <- TRUE
image(mg_dist, axes=TRUE)
mg_im <- as(mg_dist, "im")
plot(mg_im)
mg2 <- as.SpatialGridDataFrame.im(mg_im)
image(mg2, axes=TRUE)
if (require(raster, quietly=TRUE)) {
r <- as(mg2, "RasterLayer")
r_im <- as.im.RasterLayer(r)
plot(r_im)
}
}



