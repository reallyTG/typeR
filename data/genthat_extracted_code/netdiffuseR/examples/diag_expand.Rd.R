library(netdiffuseR)


### Name: diag_expand
### Title: Creates a square matrix suitable for spatial statistics models.
### Aliases: diag_expand diag_expand.list diag_expand.diffnet
###   diag_expand.matrix diag_expand.array diag_expand.dgCMatrix

### ** Examples

# Simple example ------------------------------------------------------------
set.seed(23)
g <- rgraph_er(n=10, p=.5, t=2,undirected=TRUE)

# What we've done: A list with 2 bernoulli graphs
g

# Expanding to a 20*20 matrix with structural zeros on the diagonal
# and on cell 'off' adjacency matrix
diag_expand(g)



