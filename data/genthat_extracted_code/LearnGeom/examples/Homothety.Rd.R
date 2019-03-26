library(LearnGeom)


### Name: Homothety
### Title: Creates an homothety from a given polygon
### Aliases: Homothety

### ** Examples

x_min <- -2
x_max <- 6
y_min <- -3
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P1 <- c(0,0)
P2 <- c(1,1)
P3 <- c(2,0) 
Poly <- CreatePolygon(P1, P2, P3)
Draw(Poly, "blue")
C <- c(-1,-2)
k1 <- 0.5
Poly_homothety1 <- Homothety(Poly, C, k1, lines = TRUE)
Draw(Poly_homothety1, "orange")
k2 <- 2
Poly_homothety2 <- Homothety(Poly, C, k2, lines = TRUE)
Draw(Poly_homothety2, "orange")



