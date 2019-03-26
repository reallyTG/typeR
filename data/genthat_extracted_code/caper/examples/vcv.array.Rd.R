library(caper)


### Name: VCV.array
### Title: Create a 2D or 3D variance-covariance matrix from a phylogeny
### Aliases: VCV.array
### Keywords: manip utilities

### ** Examples

tree <- rcoal(8)
tree.VCV <- vcv.phylo(tree)
tree.VCVA <- VCV.array(tree)

# reconstruct a simple VCV array
tree.VCVA.reduced <- apply(tree.VCVA, c(1,2), sum, na.rm=TRUE)

# minimal differences between the two
all((tree.VCVA.reduced - tree.VCV) < 1e-10)

# a kappa transformation of 0.5
apply(tree.VCVA ^ 0.5, c(1,2), sum, na.rm=TRUE)




