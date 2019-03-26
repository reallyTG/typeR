library(FossilSim)


### Name: reconcile.fossils.taxonomy
### Title: Reconcile existing fossil and taxonomy objects
### Aliases: reconcile.fossils.taxonomy

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils using the tree
rate = 2
f = sim.fossils.poisson(rate, tree = t)
plot(f, t)

# simulate fossils using taxonomy
s = sim.taxonomy(t, 0.5, 1, 0.5)
f = reconcile.fossils.taxonomy(f, s)
plot(f, t)




