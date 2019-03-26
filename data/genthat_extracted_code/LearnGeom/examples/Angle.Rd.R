library(LearnGeom)


### Name: Angle
### Title: Computes the angle between three points
### Aliases: Angle

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
A <- c(-1,0)
B <- c(0,0)
C <- c(0,1)
Draw(CreatePolygon(A, B, C), "transparent")
angle <- Angle(A, B, C, label = TRUE)
angle <- Angle(A, C, B, label = TRUE)
angle <- Angle(B, A, C, label = TRUE)



