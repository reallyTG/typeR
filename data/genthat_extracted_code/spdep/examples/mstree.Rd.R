library(spdep)


### Name: mstree
### Title: Find the minimal spanning tree
### Aliases: mstree
### Keywords: graphs spatial

### ** Examples

### loading data
require(maptools)
bh <- readShapePoly(system.file("etc/shapes/bhicv.shp",
      package="spdep")[1])
### data padronized
dpad <- data.frame(scale(bh@data[,5:8]))

### neighboorhod list 
bh.nb <- poly2nb(bh)

### calculing costs
lcosts <- nbcosts(bh.nb, dpad)

### making listw
nb.w <- nb2listw(bh.nb, lcosts, style="B")

### find a minimum spanning tree
system.time(mst.bh <- mstree(nb.w,5))

dim(mst.bh)

head(mst.bh)
tail(mst.bh)

### the mstree plot
par(mar=c(0,0,0,0))
plot(mst.bh, coordinates(bh), col=2, 
     cex.lab=.7, cex.circles=0.035, fg="blue")
plot(bh, border=gray(.5), add=TRUE)




