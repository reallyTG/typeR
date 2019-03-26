library(phangorn)


### Name: treedist
### Title: Distances between trees
### Aliases: treedist sprdist SPR.dist RF.dist wRF.dist KF.dist path.dist
### Keywords: classif

### ** Examples


tree1 <- rtree(100, rooted=FALSE)
tree2 <- rSPR(tree1, 3)
RF.dist(tree1, tree2)
treedist(tree1, tree2)
sprdist(tree1, tree2)
trees <- rSPR(tree1, 1:5)
SPR.dist(tree1, trees)




