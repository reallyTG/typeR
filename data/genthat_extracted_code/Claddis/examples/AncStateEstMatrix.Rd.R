library(Claddis)


### Name: AncStateEstMatrix
### Title: Ancestral Character State Estimation
### Aliases: AncStateEstMatrix

### ** Examples


# Set random seed:
set.seed(4)

# Generate a random tree for the Day data set:
tree <- rtree(n = nrow(Day2016$Matrix_1$Matrix))

# Update taxon names to match those in the data matrix:
tree$tip.label <- rownames(Day2016$Matrix_1$Matrix)

# Set root time by making youngest taxon extant:
tree$root.time <- max(diag(vcv(tree)))

# Use Day matrix as cladistic matrix:
CladisticMatrix <- Day2016

# Prune most characters out to make example run fast:
CladisticMatrix <- MatrixPruner(CladisticMatrix,
  characters2prune = c(2:3, 5:37))

# Estimate ancestral states:
AncStateEstMatrix(CladisticMatrix = CladisticMatrix,
  Tree = tree)




