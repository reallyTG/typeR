library(influenceR)


### Name: keyplayer
### Title: Compute a KPP-Pos set for a given graph.
### Aliases: keyplayer

### ** Examples

ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
keyplayer(ig.ex, k=10) # key-player set consisting of 10 actors



