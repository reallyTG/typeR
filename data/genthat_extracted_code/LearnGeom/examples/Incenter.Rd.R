library(LearnGeom)


### Name: Incenter
### Title: Computes the incenter of a given triangle
### Aliases: Incenter

### ** Examples

P1 <- c(0,0)
P2 <- c(1,1)
P3 <- c(2,0) 
Tri <- CreatePolygon(P1, P2, P3)
x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
Draw(Tri, "transparent")
I <- Incenter(Tri, lines = TRUE)
Draw(I, "red")



