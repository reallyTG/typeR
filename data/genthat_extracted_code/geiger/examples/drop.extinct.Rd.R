library(geiger)


### Name: drop.extinct
### Title: prune specified taxa from a phylogenetic tree
### Aliases: drop.extinct is.extinct drop.random
### Keywords: graphs manip

### ** Examples


# Birth-death tree with extinct taxa
p1 <- sim.bdtree(b=0.2, d=0.1, stop="time", seed=1, t=30)
plot(p1, cex=0.25)

# List extinct taxa
p1.extinct <- is.extinct(p1)

# Previous tree with extinct taxa removed
p2 <- drop.extinct(p1)
plot(p2, cex=0.5)





