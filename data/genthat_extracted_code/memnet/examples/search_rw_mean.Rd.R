library(memnet)


### Name: search_rw_mean
### Title: Search network repeatedly using switcher-random walk process
### Aliases: search_rw_mean

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# determine mean number of steps from node 2 and 6
# to nodes 3, 4, and 5
search_rw_mean(get_adjlist(network), c(2, 6), c(3, 4, 5))

# determine mean number of steps from node 2 and 6 to nodes 3, 4, and 5
# with high jump probability
search_rw_mean(get_adjlist(network), start = c(2, 6), observe = c(3, 4, 5), pjump = .5)




