library(memnet)


### Name: one_search
### Title: Search network using switcher-random walk process
### Aliases: one_search

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# observe number of steps from node 2
# to nodes 3, 4, and 5
one_search(get_adjlist(network), 2, c(3, 4, 5))

# observe number of steps from node 2 to nodes 3, 4, and 5
# with high jump probability
one_search(get_adjlist(network), start = 2, observe = c(3, 4, 5), pjump = .5)




