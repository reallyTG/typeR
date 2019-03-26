library(LearnGeom)


### Name: CreateRegularPolygon
### Title: Creates a matrix to represent a regular polygon
### Aliases: CreateRegularPolygon

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
n <- 5
C <- c(0,0) 
l <- 1
Penta <- CreateRegularPolygon(n, C, l)
Draw(Penta, "blue", label = TRUE)



