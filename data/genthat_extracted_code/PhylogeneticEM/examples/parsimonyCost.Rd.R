library(PhylogeneticEM)


### Name: parsimonyCost
### Title: Minimal number of shifts needed to get a clustering.
### Aliases: parsimonyCost

### ** Examples

tree <- read.tree(text="(((1,1),2),2);")
plot(tree); nodelabels()
clusters <- c(1, 1, 2, 2)
costs <- parsimonyCost(tree, clusters)
costs

## Extract the parsimony cost at the root
extract(costs)

## Extract the cost for the sub-tree below node 7
extract(costs, 7)




