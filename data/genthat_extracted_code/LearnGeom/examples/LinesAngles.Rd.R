library(LearnGeom)


### Name: LinesAngles
### Title: Computes the angle that form two lines
### Aliases: LinesAngles

### ** Examples

P1 <- c(0,0)
P2 <- c(1,1)
Line1 <- CreateLinePoints(P1, P2)
P3 <- c(1,-1)
P4 <- c(2,3)
Line2 <- CreateLinePoints(P3, P4)
angle <- LinesAngles(Line1, Line2)



