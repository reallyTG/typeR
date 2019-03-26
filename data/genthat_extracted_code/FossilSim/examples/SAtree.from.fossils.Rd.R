library(FossilSim)


### Name: SAtree.from.fossils
### Title: Transforms a tree and fossils dataframe to a combined SA tree.
###   Sampled ancestors are represented as tips on zero-length edges to
###   maintain compatibility with the ape format. Tip labels are set to
###   "species id"_"index", where the most recent tip of a given species
###   receives index 1 and indices increase towards the past.
### Aliases: SAtree.from.fossils

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils
f = sim.fossils.poisson(rate = 2, tree = t)

# transform format
t2 = SAtree.from.fossils(t,f)
plot(t2)



