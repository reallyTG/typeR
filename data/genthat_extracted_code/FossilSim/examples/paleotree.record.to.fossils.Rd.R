library(FossilSim)


### Name: paleotree.record.to.fossils
### Title: Transforms a fossilRecordSimulation object from package
###   paleotree to a tree and taxonomy and fossils objects.
### Aliases: paleotree.record.to.fossils

### ** Examples

if (requireNamespace("paleotree", quietly = TRUE)) {
# simulate record
record = paleotree::simFossilRecord(p=0.1, q=0.1,r=0.1, nruns=1, nTotalTaxa=c(30,40),
    nExtant=0, nSamp = c(5,25))

# transform format
l_tf = paleotree.record.to.fossils(record)
l_tf$tree
l_tf$taxonomy
l_tf$fossils
}




