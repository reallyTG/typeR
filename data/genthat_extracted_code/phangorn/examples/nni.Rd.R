library(phangorn)


### Name: nni
### Title: Tree rearrangements.
### Aliases: nni rNNI rSPR
### Keywords: cluster

### ** Examples


tree <- unroot(rtree(20))
trees1 <- nni(tree)
trees2 <- rSPR(tree, 2, 10)




