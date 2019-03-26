library(oppr)


### Name: branch_matrix
### Title: Branch matrix
### Aliases: branch_matrix branch_matrix.default branch_matrix.phylo

### ** Examples

# load Matrix package to plot matrices
library(Matrix)

# load data
data(sim_tree)

# generate species by branch matrix
m <- branch_matrix(sim_tree)

# plot data
par(mfrow = c(1,2))
plot(sim_tree, main = "phylogeny")
image(m, main = "branch matrix")




