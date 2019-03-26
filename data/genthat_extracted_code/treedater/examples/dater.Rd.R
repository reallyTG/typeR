library(treedater)


### Name: dater
### Title: Estimate a time-scaled tree and fit a molecular clock
### Aliases: dater

### ** Examples

## simulate a random tree and sample times for demonstration
# make a random tree:
tre <- ape::rtree(50)
# sample times based on distance from root to tip:
sts <- setNames( ape::node.depth.edgelength( tre )[1:ape::Ntip(tre)], tre$tip.label)
# modify edge length to represent evolutionary distance with rate 1e-3:
tre$edge.length <- tre$edge.length * 1e-3
# treedater: 
td <- dater( tre, sts =sts )





