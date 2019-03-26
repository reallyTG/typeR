library(FossilSim)


### Name: sampled.tree.from.combined
### Title: Removes all unsampled lineages from a combined tree. Extinct
###   tips are only sampled if they are fossils. With default settings all
###   extant tips are sampled.
### Aliases: sampled.tree.from.combined

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils
f = sim.fossils.poisson(rate = 2, tree = t)

# transform format
t2 = SAtree.from.fossils(t,f)

# transform to sampled tree
t3 = sampled.tree.from.combined(t2)
plot(t3)



