library(FossilSim)


### Name: prune.fossils
### Title: Removes all intermediate fossils from a combined tree and labels
###   the first and last fossils of each lineage. Can be used with sampled
###   or complete trees. If only one fossil is present for a particular
###   species it is labelled as first.
### Aliases: prune.fossils

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils
f = sim.fossils.poisson(rate = 2, tree = t)

# transform format
t2 = SAtree.from.fossils(t,f)

# prune fossils
t4 = prune.fossils(t2)

# or transform to sampled tree first
t3 = sampled.tree.from.combined(t2)
t4 = prune.fossils(t3)
plot(t4)



