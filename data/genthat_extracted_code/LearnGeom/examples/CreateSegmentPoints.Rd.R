library(LearnGeom)


### Name: CreateSegmentPoints
### Title: Creates a matrix that represents the segment that connects two
###   points
### Aliases: CreateSegmentPoints

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P1 <- c(0,0)
P2 <- c(1,1)
Segment <- CreateSegmentPoints(P1, P2)
Draw(Segment, "black")



