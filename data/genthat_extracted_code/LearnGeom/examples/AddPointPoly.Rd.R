library(LearnGeom)


### Name: AddPointPoly
### Title: Adds a point to a previously defined polygon
### Aliases: AddPointPoly

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
n <- 5
C <- c(0,0)
l <- 2
Penta <- CreateRegularPolygon(n, C, l)
Penta <- AddPointPoly(Penta, CenterPolygon(Penta), 1)
Draw(Penta, "blue", label = TRUE)



