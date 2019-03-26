library(xoi)


### Name: est.recrate
### Title: Estimate recombination rate
### Aliases: est.recrate
### Keywords: models

### ** Examples

# create equally-spaced map
pmap <- sim.map(100, n.mar=51, anchor=TRUE, include.x=FALSE, eq.spacing=TRUE)

# simulate cross
x <- sim.cross(pmap, type="bc", n.ind=501)

# estimate map for that cross
emap <- est.map(x)

# empirical estimate of recombination rate
rr <- est.recrate(emap[[1]], pmap[[1]], window=5)
plot(rr, type="l", lwd=2)




