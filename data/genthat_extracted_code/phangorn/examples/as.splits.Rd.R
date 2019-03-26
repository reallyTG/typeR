library(phangorn)


### Name: allSplits
### Title: Splits representation of graphs and trees.
### Aliases: allSplits allCircularSplits as.splits splits as.Matrix
###   distinct.splits as.phylo.splits addTrivialSplits removeTrivialSplits
###   matchSplits as.matrix.splits as.Matrix.splits print.splits c.splits
###   unique.splits as.splits.phylo as.splits.multiPhylo as.splits.networx
###   as.prop.part.splits as.bitsplits.splits compatible
### Keywords: cluster

### ** Examples


(sp <- as.splits(rtree(5)))
write.nexus.splits(sp)
spl <- allCircularSplits(5)
plot(as.networx(spl), "2D")




