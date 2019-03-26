library(LearnGeom)


### Name: Circumcenter
### Title: Computes the circumcenter of a given triangle, that is, the
###   intersection of its three medians
### Aliases: Circumcenter

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
I <- Circumcenter(Tri, lines = TRUE)
Draw(I, "red")



