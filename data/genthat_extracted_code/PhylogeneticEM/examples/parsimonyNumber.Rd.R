library(PhylogeneticEM)


### Name: parsimonyNumber
### Title: Number of equivalent parsimonious allocations.
### Aliases: parsimonyNumber

### ** Examples

tree <- read.tree(text="(((0,1),2),2);")
plot(tree); nodelabels()
clusters <- c(0, 1, 2, 2)
n_sols <- parsimonyNumber(tree, clusters)
n_sols

## Extract the number of parsimonious solutions at the root
extract(n_sols)

## Extract the cost of the solutions from the root
extract(n_sols, what = "cost")
extract(parsimonyCost(tree, clusters)) # same, more efficient

## Extract for the sub-tree below node 7
extract(n_sols, 7) # Result: 2 (the ancestral state is either "0" or "1"). 




