library(treedater)


### Name: boot
### Title: Estimate of confidence intervals of molecular clock parameters
###   with user-supplied set of bootstrap trees
### Aliases: boot

### ** Examples

# simulate a tree 
tre <- ape::rtree(25)
# sample times based on distance from root to tip:
sts <- setNames( ape::node.depth.edgelength( tre )[1:ape::Ntip(tre)], tre$tip.label)
# make a list of trees that simulate outcome of bootstrap using nonparametric phylogeny estimation
# also modify edge length to represent evolutionary distance with rate 1e-3:
bootTrees <- lapply( 1:25, function(i) {
	.tre <- tre
	.tre$edge.length <- tre$edge.length * pmax(rnorm( length(tre$edge.length), 1e-3, 1e-4 ), 0 )
	.tre 
})
tre$edge.length <- tre$edge.length * 1e-3
# run treedater
td <- dater( tre, sts  )
# bootstrap: 
( tdboot <- boot( td, bootTrees ) )
# plot lineages through time :
plot( tdboot )





