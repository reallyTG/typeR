library(rgeos)


### Name: gDelaunayTriangulation
### Title: Compute Delaunay triangulation between points
### Aliases: gDelaunayTriangulation
### Keywords: spatial

### ** Examples

if (version_GEOS0() > "3.4.0") {
library(sp)
data(meuse)
coordinates(meuse) <- c("x", "y")
plot(gDelaunayTriangulation(meuse))
points(meuse)
out <- gDelaunayTriangulation(meuse, onlyEdges=TRUE)
lns <- slot(slot(out, "lines")[[1]], "Lines")
out1 <- SpatialLines(lapply(seq(along=lns), function(i) Lines(list(lns[[i]]),
 ID=as.character(i))))
out2 <- lapply(1:length(out1), function(i) which(gTouches(meuse, out1[i],
 byid=TRUE)))
out3 <- do.call("rbind", out2)
o <- order(out3[,1], out3[,2])
out4 <- out3[o,]
out5 <- data.frame(from=out4[,1], to=out4[,2], weight=1)
head(out5)
## Not run: 
##D if (require(spdep)) {
##D class(out5) <- c("spatial.neighbour", class(out5))
##D attr(out5, "n") <- length(meuse)
##D attr(out5, "region.id") <- as.character(1:length(meuse))
##D nb1 <- sn2listw(out5)$neighbours
##D nb2 <- make.sym.nb(nb1)
##D }
## End(Not run)
}



