library(LearnGeom)


### Name: Star
### Title: Creates a closed curve with the shape of a star. Each of the
###   stars produced by this function is built through a simple iterative
###   process based on segment drawing for certain angles and lengths. It
###   can also produce regular polygons for some combinations of the
###   parameters
### Aliases: Star

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P <- c(0,0)
angle <- 0
l <- 1
Star(P, angle, l)



