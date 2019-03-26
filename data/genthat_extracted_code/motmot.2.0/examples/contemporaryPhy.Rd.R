library(motmot.2.0)


### Name: contemporaryPhy
### Title: prune tree and data to lineages present in a time bin in the
###   past
### Aliases: contemporaryPhy

### ** Examples

## prune a random tree to taxa present between 4 and 2 units before present
# generate tree
set.seed(20)
tree <- rtree(20)
# generate traits
traits <- rnorm(20)
# plot tree and timeframe
plot(tree)
max.age <- nodeTimes(tree)[1,1]
abline(v=max.age - c(4, 2))
# prune tree to timeframe
cont.tree <- contemporaryPhy(phy=tree, maxBin=4, minBin=2, allTraits=traits)
plot(cont.tree$phy)



