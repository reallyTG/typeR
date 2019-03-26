library(influenceR)


### Name: constraint
### Title: Burt's Constraint Index.
### Aliases: constraint

### ** Examples

ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
constraint(ig.ex) # constraint scores for each node in the graph



