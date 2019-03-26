library(LearnGeom)


### Name: ShearedPolygon
### Title: Creates a sheared polygon from a given one
### Aliases: ShearedPolygon

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
Square <- CreateRegularPolygon(4, c(-2, 0), 1)
Draw(Square, "blue")
k <- 1
Square_shearX <- Translate(ShearedPolygon(Square, k, "horizontal"), c(3,0))
Draw(Square_shearX, "orange")
Square_shearY <- Translate(ShearedPolygon(Square, k, "vertical"), c(3,0))
Draw(Square_shearY, "orange")



