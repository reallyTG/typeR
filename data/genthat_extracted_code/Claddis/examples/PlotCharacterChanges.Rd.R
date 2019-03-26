library(Claddis)


### Name: PlotCharacterChanges
### Title: Plots character changes on branches
### Aliases: PlotCharacterChanges

### ** Examples


# Set random seed:
set.seed(17)

# Generate a random tree for the Michaux data set:
tree <- rtree(nrow(Michaux1989$Matrix_1$Matrix))

# Update taxon names to match those in the data matrix:
tree$tip.label <- rownames(Michaux1989$Matrix_1$Matrix)

# Set root time by making youngest taxon extant:
tree$root.time <- max(diag(vcv(tree)))

# Get discrete character rates (includes changes):
out <- DiscreteCharacterRate(tree, Michaux1989,
  seq(tree$root.time, 0, length.out = 3),
  BranchPartitionsToTest = list(list(1)), Alpha = 0.01)

# Plot character changes on the tree:
PlotCharacterChanges(out$InferredCharacterChanges,
  tree)




