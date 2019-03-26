library(LearnGeom)


### Name: SimilarPolygon
### Title: Creates a similar polygon to a given one
### Aliases: SimilarPolygon

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
k <- 2
Poly_similar <- SimilarPolygon(Poly, k)
Draw(Translate(Poly_similar, c(-1,2)), "orange")



