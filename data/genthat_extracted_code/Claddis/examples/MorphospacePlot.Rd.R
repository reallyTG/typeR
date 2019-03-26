library(Claddis)


### Name: MorphospacePlot
### Title: Plot Morphopace
### Aliases: MorphospacePlot
### Keywords: coordinates principal

### ** Examples


# Set random seed:
set.seed(4)

# Generate a random tree for the Michaux 1989 data set:
tree <- rtree(length(rownames(Michaux1989$Matrix_1$Matrix)))

# Add taxon names to the tree:
tree$tip.label <- rownames(Michaux1989$Matrix_1$Matrix)

# Perform a phylogenetic Principal Coordinates Analysis:
pcoa_input <- MorphMatrix2PCoA(Michaux1989, Tree = tree)

# Plot the results:
MorphospacePlot(pcoa_input, plot_taxon_names = TRUE)




