library(treedater)


### Name: parboot
### Title: Estimate of confidence intervals using parametric bootstrap for
###   molecular clock dating.
### Aliases: parboot

### ** Examples

# make a random tree
tre <- ape::rtree(25)
# simulate sample times based on distance from root to tip:
sts <- setNames( ape::node.depth.edgelength( tre )[1:ape::Ntip(tre)], tre$tip.label)
# modify edge length to represent evolutionary distance with rate 1e-3:
tre$edge.length <- tre$edge.length * 1e-3
# treedater: 
td <- dater( tre, sts =sts )
# parametric bootstrap: 
pb <- parboot( td, nreps=25 )
# plot lineages through time
plot( pb )




