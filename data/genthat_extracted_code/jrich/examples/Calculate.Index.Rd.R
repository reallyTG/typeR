library(jrich)


### Name: Calculate.Index
### Title: Indices values and Jack-knife indices for a single topology.
### Aliases: Calculate.Index

### ** Examples

library(jrich)
data(tree)
data(distribution)
## Standarized by the sum of indices in the distribution
Calculate.Index(tree=tree, distribution = distribution, verbose=TRUE, standard = "distribution")

## Standarized by the sum of indices in the tree (as figure 1 in Miranda-Esquivel 2016)
Calculate.Index(tree=tree, distribution = distribution, verbose=TRUE, standard = "tree")





