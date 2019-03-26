library(influenceR)


### Name: ens
### Title: Burt's Effective Network Size and Constraint index. The next two
###   functions below provide ways to measure the actors' access to
###   structural holes in a network. Structural holes "provide
###   opportunities to broker connections between people" (Burt 2008).
### Aliases: ens

### ** Examples

ig.ex <- igraph::erdos.renyi.game(100, p.or.m=0.3) # generate an undirected 'igraph' object
ens(ig.ex) # Effective Network Size scores for each node in the graph



