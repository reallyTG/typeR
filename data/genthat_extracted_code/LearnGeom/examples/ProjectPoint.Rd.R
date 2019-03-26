library(LearnGeom)


### Name: ProjectPoint
### Title: Computes the orthogonal projection of a point onto a line
### Aliases: ProjectPoint

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
xx <- c(0,1,2)
yy <- c(0,1,0)
P1 <- c(0,0)
P2 <- c(1,1)
Line <- CreateLinePoints(P1, P2)
Draw(Line, "black")
P <- c(-2,2)
Draw(P, "black")
projection <- ProjectPoint(P, Line)
Draw(projection, "red")



