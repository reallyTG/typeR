library(Claddis)


### Name: MorphMatrix2PCoA
### Title: Principal Coordinates on a Cladistic Matrix
### Aliases: MorphMatrix2PCoA
### Keywords: classic coordinates multidimensional principal scaling,

### ** Examples


# Run on Michaux (189) data set with defaults:
x <- MorphMatrix2PCoA(Michaux1989)

# Show output:
x

# Generate a (made up) tree:
Tree <- rtree(length(rownames(Michaux1989$Matrix_1$Matrix)))

# Add taxon names to it:
Tree$tip.label <- rownames(Michaux1989$Matrix_1$Matrix)

# Set root time by making youngest taxon extant:
Tree$root.time <- max(diag(vcv(Tree)))

# Run with tree:
y <- MorphMatrix2PCoA(Michaux1989, Tree = Tree)

# Show new output:
y




