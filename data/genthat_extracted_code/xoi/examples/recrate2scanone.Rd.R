library(xoi)


### Name: recrate2scanone
### Title: Convert recrate to scanone format
### Aliases: recrate2scanone
### Keywords: models

### ** Examples

pmap <- sim.map(100, n.mar=51, anchor=TRUE, include.x=FALSE, eq.spacing=TRUE)

# simulate cross
x <- sim.cross(pmap, type="bc", n.ind=501)

# estimate map for that cross
emap <- est.map(x)

# empirical estimate of recombination rate
rr <- est.recrate(emap[[1]], pmap[[1]], window=5)

# make it a list (one component per chromosome, but here just the one chromosome)
rr <- list("1"=rr)

# convert to scanone output and plot
rr_scanone <- recrate2scanone(rr)
plot(rr_scanone)




