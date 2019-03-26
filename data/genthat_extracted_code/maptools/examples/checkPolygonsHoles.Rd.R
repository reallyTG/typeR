library(maptools)


### Name: checkPolygonsHoles
### Title: Check holes in Polygons objects
### Aliases: checkPolygonsHoles rgeosStatus gpclibPermit gpclibPermitStatus
### Keywords: spatial

### ** Examples

if (rgeosStatus()) {
nc1 <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat +ellps=clrk66"))
pl <- slot(nc1, "polygons")
sapply(slot(pl[[4]], "Polygons"), function(x) slot(x, "hole"))
pl[[4]] <- Polygons(list(slot(pl[[4]], "Polygons")[[1]],
 Polygon(slot(slot(pl[[4]], "Polygons")[[2]], "coords"), hole=TRUE),
 slot(pl[[4]], "Polygons")[[3]]), slot(pl[[4]], "ID"))
sapply(slot(pl[[4]], "Polygons"), function(x) slot(x, "hole"))
pl_new <- lapply(pl, checkPolygonsHoles)
sapply(slot(pl_new[[4]], "Polygons"), function(x) slot(x, "hole"))
srs <- slot(slot(pl[[1]], "Polygons")[[1]], "coords")
hle2 <- structure(c(-81.64093, -81.38380, -81.34165, -81.66833, -81.64093, 
 36.57865, 36.57234, 36.47603, 36.47894, 36.57865), .Dim = as.integer(c(5, 2)))
hle3 <- structure(c(-81.47759, -81.39118, -81.38486, -81.46705, -81.47759, 
 36.56289, 36.55659, 36.49907, 36.50380, 36.56289), .Dim = as.integer(c(5, 2)))
x <- Polygons(list(Polygon(srs), Polygon(hle2), Polygon(hle3)),
 ID=slot(pl[[1]], "ID"))
sapply(slot(x, "Polygons"), function(x) slot(x, "hole"))
res <- checkPolygonsHoles(x)
sapply(slot(res, "Polygons"), function(x) slot(x, "hole"))
## Not run: 
##D opar <- par(mfrow=c(1,2))
##D SPx <- SpatialPolygons(list(x))
##D plot(SPx)
##D text(t(sapply(slot(x, "Polygons"), function(i) slot(i, "labpt"))),
##D  labels=sapply(slot(x, "Polygons"), function(i) slot(i, "hole")), cex=0.6)
##D title(xlab="Hole slot values before checking")
##D SPres <- SpatialPolygons(list(res))
##D plot(SPres)
##D text(t(sapply(slot(res, "Polygons"), function(i) slot(i, "labpt"))),
##D  labels=sapply(slot(res, "Polygons"), function(i) slot(i, "hole")), cex=0.6)
##D title(xlab="Hole slot values after checking")
##D par(opar)
##D p1 <- Polygon(cbind(x=c(0, 0, 10, 10, 0), y=c(0, 10, 10, 0, 0))) # I
##D p2 <- Polygon(cbind(x=c(3, 3, 7, 7, 3), y=c(3, 7, 7, 3, 3))) # H
##D p8 <- Polygon(cbind(x=c(1, 1, 2, 2, 1), y=c(1, 2, 2, 1, 1))) # H
##D p9 <- Polygon(cbind(x=c(1, 1, 2, 2, 1), y=c(5, 6, 6, 5, 5))) # H
##D p3 <- Polygon(cbind(x=c(20, 20, 30, 30, 20), y=c(20, 30, 30, 20, 20))) # I
##D p4 <- Polygon(cbind(x=c(21, 21, 29, 29, 21), y=c(21, 29, 29, 21, 21))) # H
##D p14 <- Polygon(cbind(x=c(21, 21, 29, 29, 21), y=c(21, 29, 29, 21, 21))) # H
##D p5 <- Polygon(cbind(x=c(22, 22, 28, 28, 22), y=c(22, 28, 28, 22, 22))) # I
##D p15 <- Polygon(cbind(x=c(22, 22, 28, 28, 22), y=c(22, 28, 28, 22, 22))) # I
##D p6 <- Polygon(cbind(x=c(23, 23, 27, 27, 23), y=c(23, 27, 27, 23, 23))) # H
##D p7 <- Polygon(cbind(x=c(13, 13, 17, 17, 13), y=c(13, 17, 17, 13, 13))) # I
##D p10 <- Polygon(cbind(x=c(24, 24, 26, 26, 24), y=c(24, 26, 26, 24, 24))) # I
##D p11 <- Polygon(cbind(x=c(24.25, 24.25, 25.75, 25.75, 24.25),
##D  y=c(24.25, 25.75, 25.75, 24.25, 24.25))) # H
##D p12 <- Polygon(cbind(x=c(24.5, 24.5, 25.5, 25.5, 24.5),
##D  y=c(24.5, 25.5, 25.5, 24.5, 24.5))) # I
##D p13 <- Polygon(cbind(x=c(24.75, 24.75, 25.25, 25.25, 24.75),
##D  y=c(24.75, 25.25, 25.25, 24.75, 24.75))) # H
##D lp <- list(p1, p2, p13, p7, p6, p5, p4, p3, p8, p11, p12, p9, p10, p14, p15)
##D #           1   2    3   4   5   6   7   8   9   10   11  12   13   14   15
##D #           0   1   11   0   6   0   8   0   1   13    0   1    0  (7)  (6)
##D #           I   H    H   I   H   I   H   I   H    H    I   H    I   ?    ?
##D pls <- Polygons(lp, ID="1")
##D comment(pls)
##D pls1 <- checkPolygonsHoles(pls)
##D comment(pls1)
##D opar <- par(mfrow=c(1,2))
##D plot(SpatialPolygons(list(pls)), col="magenta", pbg="cyan", usePolypath=FALSE)
##D title(xlab="Hole slot values before checking")
##D plot(SpatialPolygons(list(pls1)), col="magenta", pbg="cyan", usePolypath=FALSE)
##D title(xlab="Hole slot values after checking")
##D par(opar)
## End(Not run)
}



