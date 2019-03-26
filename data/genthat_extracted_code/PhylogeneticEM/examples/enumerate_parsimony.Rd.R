library(PhylogeneticEM)


### Name: enumerate_parsimony
### Title: Enumerate all the possible regime allocations, given a
###   clustering of the tips.
### Aliases: enumerate_parsimony

### ** Examples

tree <- read.tree(text="(((A,B),C),D);")
plot(tree)
clusters <- c(0, 1, 2, 2)
sols <- enumerate_parsimony(tree, clusters)
plot(sols)

## Extract the parsimonious solutions from the root
extract(sols) # each line is a solution, with states of each node

## Extract the number of solutions from the root
extract(sols, what = "number")
extract(parsimonyNumber(tree, clusters)) # same result, more efficient

## Extract the cost of the solutions from the root
extract(sols, what = "cost")
extract(parsimonyCost(tree, clusters)) # same result, more efficient:

## Extract for the sub-tree below node 7
extract(sols, 7) # NAs: non-existing nodes in the sub-tree




