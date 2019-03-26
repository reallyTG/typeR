library(sp)


### Name: meuse.riv
### Title: River Meuse outline
### Aliases: meuse.riv meuse.area
### Keywords: datasets

### ** Examples

data(meuse.riv)
plot(meuse.riv, type = "l", asp = 1)
data(meuse.grid)
coordinates(meuse.grid) = c("x", "y")
gridded(meuse.grid) = TRUE
image(meuse.grid, "dist", add = TRUE)
data(meuse)
coordinates(meuse) = c("x", "y")
meuse.sr = SpatialPolygons(list(Polygons(list(Polygon(meuse.riv)),"meuse.riv")))
spplot(meuse.grid, col.regions=bpy.colors(), main = "meuse.grid",
  sp.layout=list(
	list("sp.polygons", meuse.sr),
	list("sp.points", meuse, pch="+", col="black")
  )
)
spplot(meuse, "zinc", col.regions=bpy.colors(),  main = "zinc, ppm",
  cuts = c(100,200,400,700,1200,2000), key.space = "right",
  sp.layout= list("sp.polygons", meuse.sr, fill = "lightblue")
)

# creating meuse.area from meuse.grid:
if (require(rgeos)) {
    meuse.area = gUnaryUnion(as(meuse.grid, "SpatialPolygons"))
	plot(meuse.area)
}




