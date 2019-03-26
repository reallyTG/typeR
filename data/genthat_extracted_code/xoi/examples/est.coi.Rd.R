library(xoi)


### Name: est.coi
### Title: Estimate the coincidence function
### Aliases: est.coi
### Keywords: models

### ** Examples


map1 <- sim.map(103, n.mar=104, anchor=TRUE, include.x=FALSE, eq=TRUE)
x <- sim.cross(map1, n.ind=2000, m=6, type="bc")

out <- est.coi(x, window=5)
plot(coi1 ~ d, data=out, type="l", lwd=2, col="blue")
lines(coi2 ~ d, data=out, lwd=2, col="green")
lines(gammacoi(7), lwd=2, col="red", lty=2)




