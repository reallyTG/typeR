library(sp)


### Name: aggregate
### Title: aggregation of spatial objects
### Aliases: aggregate aggregate.Spatial
### Keywords: methods

### ** Examples

data("meuse")
coordinates(meuse) <- ~x+y
data("meuse.grid")
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
i = cut(meuse.grid$dist, c(0,.25,.5,.75,1), include.lowest = TRUE)
j = sample(1:2, 3103,replace=TRUE)
## Not run: 
##D if (require(rgeos)) {
##D 	# aggregation by spatial object:
##D 	ab = gUnaryUnion(as(meuse.grid, "SpatialPolygons"), meuse.grid$part.a)
##D 	x = aggregate(meuse["zinc"], ab, mean)
##D 	spplot(x)
##D 	# aggregation of multiple variables
##D 	x = aggregate(meuse[c("zinc", "copper")], ab, mean)
##D 	spplot(x)
##D 	# aggregation by attribute, then dissolve to polygon:
##D 	x = aggregate(meuse.grid["dist"], list(i=i), mean)
##D 	spplot(x["i"])
##D 	x = aggregate(meuse.grid["dist"], list(i=i,j=j), mean)
##D 	spplot(x["dist"], col.regions=bpy.colors())
##D 	spplot(x["i"], col.regions=bpy.colors(4))
##D 	spplot(x["j"], col.regions=bpy.colors())
##D }
## End(Not run)

x = aggregate(meuse.grid["dist"], list(i=i,j=j), mean, dissolve = FALSE)
spplot(x["j"], col.regions=bpy.colors())

if (require(gstat) && require(rgeos)) {
	x = idw(log(zinc)~1, meuse, meuse.grid, debug.level=0)[1]
	spplot(x[1],col.regions=bpy.colors())
	i = cut(x$var1.pred, seq(4, 7.5, by=.5), 
		include.lowest = TRUE)
	xa = aggregate(x["var1.pred"], list(i=i), mean)
	spplot(xa[1],col.regions=bpy.colors(8))
}

if (require(rgeos)) {
# Area-weighted example, using two partly overlapping grids:

  gt1 = SpatialGrid(GridTopology(c(0,0), c(1,1), c(4,4)))
  gt2 = SpatialGrid(GridTopology(c(-1.25,-1.25), c(1,1), c(4,4)))

  # convert both to polygons; give p1 attributes to aggregate
  p1 = SpatialPolygonsDataFrame(as(gt1, "SpatialPolygons"), 
		  data.frame(v = 1:16, w=5:20, x=factor(1:16)), match.ID = FALSE)
  p2 = as(gt2, "SpatialPolygons")

  # plot the scene:
  plot(p1, xlim = c(-2,4), ylim = c(-2,4))
  plot(p2, add = TRUE, border = 'red')
  i = gIntersection(p1, p2, byid = TRUE)
  plot(i, add=TRUE, density = 5, col = 'blue')
  # plot IDs p2:
  ids.p2 = sapply(p2@polygons, function(x) slot(x, name = "ID"))
  text(coordinates(p2), ids.p2)
  # plot IDs i:
  ids.i = sapply(i@polygons, function(x) slot(x, name = "ID"))
  text(coordinates(i), ids.i, cex = .8, col = 'blue')

  # compute & plot area-weighted average; will warn for the factor
  ret = aggregate(p1, p2, areaWeighted = TRUE)
  spplot(ret)

  # all-factor attributes: compute area-dominant factor level:
  ret = aggregate(p1["x"], p2, areaWeighted = TRUE) 
  spplot(ret)
}



