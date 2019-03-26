library(FossilSim)


### Name: fossils.to.paleotree.record
### Title: Transforms a fossils dataframe and either taxonomy or tree into
###   a fossilRecordSimulation object from package paleotree.
### Aliases: fossils.to.paleotree.record

### ** Examples

# simulate tree
t = ape::rtree(6)
# simulate fossils using taxonomy
s = sim.taxonomy(t, 0.5, 1, 0.5)
f = sim.fossils.poisson(2, taxonomy = s)
# transform format
record = fossils.to.paleotree.record(f, taxonomy = s)



