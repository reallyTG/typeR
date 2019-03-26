library(LearnGeom)


### Name: CreateArcPointsDist
### Title: Creates an arc of a circumference to connect two points
### Aliases: CreateArcPointsDist

### ** Examples

x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
CoordinatePlane(x_min, x_max, y_min, y_max)
P1 <- c(-3,2)
P2 <- c(0,0)
r <- sqrt(18)/2
choice=1
direction="anticlock"
Arc <- CreateArcPointsDist(P1, P2, r, choice, direction)
Draw(Arc, "red")
choice=2
direction="anticlock"
Arc <- CreateArcPointsDist(P1, P2, r, choice, direction)
Draw(Arc, "blue")
choice=1
direction="clock"
Arc <- CreateArcPointsDist(P1, P2, r, choice, direction)
Draw(Arc, "pink")
choice=2
direction="clock"
Arc <- CreateArcPointsDist(P1, P2, r, choice, direction)
Draw(Arc, "green")



