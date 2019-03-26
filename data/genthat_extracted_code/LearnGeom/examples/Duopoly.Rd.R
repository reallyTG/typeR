library(LearnGeom)


### Name: Duopoly
### Title: Plots a fractal curve from the trochoids family. Any curve from
###   this family can be defined by some parametrical equations, but they
###   can also be produced (approximated) through a simple iterative
###   process based on segment drawing for certain angles and lengths
### Aliases: Duopoly

### ** Examples

x_min <- -100
x_max <- 100
y_min <- -50
y_max <- 150
CoordinatePlane(x_min, x_max, y_min, y_max)
P <- c(0,0)
l1 <- 2
angle1 <- 3
l2 <- 2
angle2 <- 10 
Duopoly(P, l1, angle1, l2, angle2)



