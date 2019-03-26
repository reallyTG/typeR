library(LearnGeom)


### Name: CreateSegmentAngle
### Title: Creates a matrix that represents the segment that starts from a
###   point with certain length and angle
### Aliases: CreateSegmentAngle

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P <- c(0,0)
angle <- 30
l <- 1
Segment <- CreateSegmentAngle(P, angle, l)
Draw(Segment, "black")



