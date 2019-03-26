library(LearnGeom)


### Name: DistanceLines
### Title: Computes the distance between two lines
### Aliases: DistanceLines

### ** Examples

P1 <- c(0,0)
P2 <- c(1,1)
Line1 <- CreateLinePoints(P1, P2)
P3 <- c(1,-1)
P4 <- c(2,0)
Line2 <- CreateLinePoints(P3, P4)
d <- DistanceLines(Line1, Line2)



