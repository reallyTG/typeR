library(phylocurve)


### Name: paint.edges
### Title: Paint tree edges based on species regimes
### Aliases: paint.edges

### ** Examples

require(ape)
tree <- rtree(n=10)
groups <- setNames(factor(c(rep("groupA",5),rep("groupB",5))),tree$tip.label)
painted.edges <- paint.edges(tree = tree,species.groups = groups)



