library(LearnGeom)


### Name: Soddy
### Title: Finds the inner and outer Soddy circles of three given mutually
###   tangent circles
### Aliases: Soddy

### ** Examples

x_min <- -3
x_max <- 3
y_min <- -2.5
y_max <- 3.5
CoordinatePlane(x_min, x_max, y_min, y_max)
A <- c(-1,0)
B <- c(1,0)
C <- c(0,sqrt(3))
r1 <- 1
r2 <- 1
r3 <- 1
Draw(CreateArcAngles(A, r1, 0, 360), "black")
Draw(CreateArcAngles(B, r2, 0, 360), "black")
Draw(CreateArcAngles(C, r3, 0, 360), "black")
result <- Soddy(A, r1, B, r2, C, r3)
soddy_point <- result[[1]]
inner_radius <- result[[2]]
outer_radius <- result[[3]]
Draw(soddy_point,"red")
Draw(CreateArcAngles(soddy_point,inner_radius,0,360),"red")
Draw(CreateArcAngles(soddy_point,outer_radius,0,360),"red")



