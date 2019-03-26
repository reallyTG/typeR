library(influenceR)


### Name: bridging
### Title: Valente's Bridging vertex measure.
### Aliases: bridging

### ** Examples

ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
bridging(ig.ex) # bridging scores for each node in the graph



