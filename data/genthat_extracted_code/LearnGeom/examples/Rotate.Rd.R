library(LearnGeom)


### Name: Rotate
### Title: Rotates a geometric object
### Aliases: Rotate

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P1 <- c(0,0)
P2 <- c(1,1)
P3 <- c(2,0) 
Poly <- CreatePolygon(P1, P2, P3)
Draw(Poly, "blue")
fixed <- c(-1,-1)
angle <- 30
Poly_rotated <- Rotate(Poly, fixed, angle)
Draw(Poly_rotated, "orange")
fixed <- c(2,0)
Poly_rotated <- Rotate(Poly, fixed, angle)
Draw(Poly_rotated, "transparent")



