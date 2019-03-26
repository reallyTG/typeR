library(Guerry)


### Name: gfrance85
### Title: Map of France in 1830 with the Guerry data, excluding Corsica
### Aliases: gfrance85
### Keywords: datasets spatial

### ** Examples

data(gfrance85)
require(sp)
plot(gfrance85)   # plot the empty outline map

# extract some useful components
df <- data.frame(gfrance85)[,7:12]       # main moral variables
xy <- coordinates(gfrance85)             # department centroids
dep.names <- data.frame(gfrance85)[,6]
region.names <- data.frame(gfrance85)[,5]
col.region <- colors()[c(149,254,468,552,26)]

if (require(spdep)) {
  lw <- nb2listw(poly2nb(gfrance85))       # neighbors list
}

# plot the map showing regions by color with department labels
op <-par(mar=rep(0.1,4))
plot(gfrance85,col=col.region[region.names])
text(xy, labels=dep.names, cex=0.4)
par(op)





