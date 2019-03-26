library(FossilSim)


### Name: beast.fbd.format
### Title: Transforms a tree and fossils into a sampled tree in
###   beast-usable format and writes it in Newick format. Designed to work
###   with FBD.
### Aliases: beast.fbd.format

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils
f = sim.fossils.poisson(rate = 2, tree = t)

# output for BEAST
beast.fbd.format(t, f) # output on the console
beast.fbd.format(t, f, file="example.tre") # output in file



