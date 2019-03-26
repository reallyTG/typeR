library(LearnGeom)


### Name: FractalSegment
### Title: Plots a fractal curve starting from a segment
### Aliases: FractalSegment

### ** Examples

x_min <- -6
x_max <- 6
y_min <- -4
y_max <- 8
CoordinatePlane(x_min, x_max, y_min, y_max)
P1 <- c(-5,0)
P2 <- c(5,0)
angle <- 90
cut1 <- 1/3
cut2 <- 2/3
f <- 1
it <- 4
FractalSegment(P1, P2, angle, cut1, cut2, f, it)



