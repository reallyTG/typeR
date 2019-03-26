library(xoi)


### Name: coincidence
### Title: Estimate coincidence function
### Aliases: coincidence
### Keywords: utilities

### ** Examples


map1 <- sim.map(103, n.mar=104, anchor=TRUE, include.x=FALSE, eq=TRUE)
x <- sim.cross(map1, n.ind=2000, m=6, type="bc")

out <- coincidence(x, ncalc=101)
plot(out, type="l", lwd=2, ylim=c(0, max(out[,2])))




