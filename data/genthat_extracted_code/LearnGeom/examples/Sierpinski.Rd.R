library(LearnGeom)


### Name: Sierpinski
### Title: Plots the Sierpinski triangle
### Aliases: Sierpinski

### ** Examples

x_min <- -6
x_max <- 6
y_min <- -6
y_max <- 6
CoordinatePlane(x_min, x_max, y_min, y_max)
n <- 3
C <- c(0,0)
l <- 5
Tri <- CreateRegularPolygon(n, C, l)
it <- 6
Sierpinski(Tri, it)



