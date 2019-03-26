library(hyperSpec)


### Name: map.sel.poly
### Title: Interactively select a polygon (grid graphics) and highlight
###   points
### Aliases: map.sel.poly sel.poly
### Keywords: iplot

### ** Examples

if (interactive ()){
## convenience wrapper
map.sel.poly (chondro)

## customized version
data <- sample (chondro [,, 1004 - 2i ~ 1004 + 2i], 300)

plotdata <- plotvoronoi (data, clusters ~ y * x, col.regions = alois.palette ())
print (plotdata)
map.sel.poly (plotdata)

## even more customization:
plotvoronoi (data)

## interactively retrieve polygon
polygon <- sel.poly ()

## find data points within polygon
require ("sp")     
i.sel <- which (point.in.polygon (data$x, data$y, polygon [, 1], polygon [, 2]) > 0)

## work with selected points
grid.points (unit (data$x [i.sel], "native"), unit (data$y [i.sel], "native"))
}



