library(xoi)


### Name: intensity
### Title: Estimate intensity function
### Aliases: intensity
### Keywords: utilities

### ** Examples


map1 <- sim.map(103, n.mar=104, anchor=TRUE, include.x=FALSE, eq=TRUE)
x <- sim.cross(map1, n.ind=2000, m=6, type="bc")

out <- intensity(x)
plot(out, type="l", lwd=2, ylim=c(0, max(out[,2])))




