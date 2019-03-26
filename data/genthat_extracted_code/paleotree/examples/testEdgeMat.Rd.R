library(paleotree)


### Name: testEdgeMat
### Title: Test the Edge Matrix of a "phylo" Phylogeny Object for
###   Inconsistencies
### Aliases: testEdgeMat cleanNewPhylo cleanTree cleanNewPhylo

### ** Examples


set.seed(444)
tree <- rtree(10)
# should return TRUE
testEdgeMat(tree)

# should also work on star trees
testEdgeMat(stree(10))

# should also work on trees with two taxa
testEdgeMat(rtree(2))

# should also work on trees with one taxon
testEdgeMat(stree(1))

#running cleanNewPhylo on this tree should have little effect
		#beyond ladderizing it...
tree1 <- cleanNewPhylo(tree)

#compare outputs
layout(1:2)
plot(tree)
plot(tree1)
layout(1)



