library(LearnGeom)


### Name: IntersectLines
### Title: Finds the intersection of two lines
### Aliases: IntersectLines

### ** Examples

P1 <- c(0,0)
P2 <- c(1,1)
Line1 <- CreateLinePoints(P1, P2)
P3 <- c(1,-1)
P4 <- c(2,0)
Line2 <- CreateLinePoints(P3, P4)
intersection <- IntersectLines(Line1, Line2)



