library(LearnGeom)


### Name: Tessellation
### Title: Creates a tessellation from a starting set of geometric objects
### Aliases: Tessellation

### ** Examples

x_min <- -6
x_max <- 6
y_min <- -2
y_max <- 10
CoordinatePlane(x_min, x_max, y_min, y_max)
Hexa <- CreateRegularPolygon(6, c(-3,0), 1)
Draw(Hexa, "purple")
Tri <- CreatePolygon(c(-3,-1), c(Hexa[4,1],-2), c(Hexa[1,1],-2))
Draw(Tri,"pink")
objects_list <- list(Tri, Hexa)
cols <- c("pink", "purple")
direction <- c(1,0)
separation <- 1.732051 
it <- 3
Tessellation(objects_list, cols, direction, separation, it)
direction <- c(0,1)
separation <- 3
it <- 4
Tessellation(objects_list, cols, direction, separation, it)



