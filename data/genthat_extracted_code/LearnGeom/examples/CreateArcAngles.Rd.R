library(LearnGeom)


### Name: CreateArcAngles
### Title: Creates an arc of a circumference
### Aliases: CreateArcAngles

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
C <- c(0,0)
r <- 3
angle1 <- 90
angle2 <- 180
direction <- "anticlock"
Arc1 <- CreateArcAngles(C, r, angle1, angle2, direction)
Draw(Arc1, "black")
direction <- "clock"
Arc2 <- CreateArcAngles(C, r, angle1, angle2, direction)
Draw(Arc2, "red")



