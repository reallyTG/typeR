library(Claddis)


### Name: ChronoPhyloMorphospacePlot
### Title: Chronophylomorphospace Plot
### Aliases: ChronoPhyloMorphospacePlot
### Keywords: coordinates principal

### ** Examples

## No test: 

# Set random seed:
set.seed(4)

# Generate a random tree for the Michaux 1989 data set:
Tree <- rtree(nrow(Michaux1989$Matrix_1$Matrix))

# Set root time so latest tip terminates at the present:
Tree$root.time <- max(diag(vcv(Tree)))

# Add taxon names to the tree:
Tree$tip.label <- rownames(Michaux1989$Matrix_1$Matrix)

# Perform a phylogenetic Principal Coordinates Analysis:
pcoa_data <- MorphMatrix2PCoA(Michaux1989, Tree = Tree)

# Plot a chronophylomorphospace:
ChronoPhyloMorphospacePlot(pcoa_data)

## End(No test)



