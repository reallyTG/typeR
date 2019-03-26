library(LearnGeom)


### Name: ReflectedPolygon
### Title: Creates the reflection about a line of a given polygon
### Aliases: ReflectedPolygon

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
P1 <- c(-3,2)
P2 <- c(1,-4)
Line <- CreateLinePoints(P1, P2)
Draw(Line, "black")
Poly_reflected <- ReflectedPolygon(Poly, Line)
Draw(Poly_reflected, "orange")



