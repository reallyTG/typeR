library(LearnGeom)


### Name: IntersectLineCircle
### Title: Finds the intersection between a line and a circumference
### Aliases: IntersectLineCircle

### ** Examples

P1 <- c(0,0)
P2 <- c(1,1)
Line <- CreateLinePoints(P1, P2)
C <- c(0,0)
r <- 2
intersection <- IntersectLineCircle(Line, C, r)
x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
Draw(Line, "black")
Draw(CreateArcAngles(C, r, 0, 360), "black")
Draw(intersection[1,], "red")
Draw(intersection[2,], "red")



