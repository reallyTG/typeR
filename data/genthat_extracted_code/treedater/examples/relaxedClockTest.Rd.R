library(treedater)


### Name: relaxedClockTest
### Title: Use parametric bootstrap to test if relaxed clock offers
###   improved fit to data.
### Aliases: relaxedClockTest

### ** Examples

# simulate a tree 
tre <- ape::rtree(25)
# sample times based on distance from root to tip:
sts <- setNames( ape::node.depth.edgelength( tre )[1:ape::Ntip(tre)], tre$tip.label)
# modify edge length to represent evolutionary distance with rate 1e-3:
tre$edge.length <- tre$edge.length * 1e-3
relaxedClockTest( tre, sts, nreps=25)





