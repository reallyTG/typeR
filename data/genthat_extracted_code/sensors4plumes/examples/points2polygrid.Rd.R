library(sensors4plumes)


### Name: points2polygrid
### Title: Turn points (and data) into a SpatialPolygridDataFrame
### Aliases: points2polygrid

### ** Examples

# prepare
data(SPolygridDF)
regularPoints = coordinates(SPolygridDF)
irregularPoints = regularPoints + runif(12, 0.1)

# grid for regular points
newSPolygrid_reg = points2polygrid(points = regularPoints, 
                                   data = data.frame(a = 12:1 * 5))
spplot(newSPolygrid_reg, 
       sp.layout = list(list("sp.points", regularPoints, col = 3)))
       
# generate grid for irregular points with given resolution
newSPolygrid_irreg = points2polygrid(points = irregularPoints, tolerance = 0.5)
spplot(newSPolygrid_irreg, sp.layout = list("sp.points", irregularPoints, col = 3))

# with given grid
newSPolygrid_grid = points2polygrid(points = irregularPoints,
  grid = GridTopology(c(2,2), c(1,1), c(10,10)))
spplot(newSPolygrid_grid, sp.layout = list("sp.points", irregularPoints, col = 3))




