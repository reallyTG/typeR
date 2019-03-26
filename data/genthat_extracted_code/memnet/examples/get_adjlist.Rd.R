library(memnet)


### Name: get_adjlist
### Title: Get adjacency list
### Aliases: get_adjlist

### ** Examples


# generate watts strogatz graph
network = grow_ws(n = 6, k = 2, p = .5)

# transform to adjlist
get_adjlist(network)




