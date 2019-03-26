library(memnet)


### Name: get_kneighbors
### Title: Get vector of neighbors exactly k steps away
### Aliases: get_kneighbors

### ** Examples


# generate watts strogatz graph
network = grow_ws(n = 100, k = 10, p = .5)

# get neighborhood of second node
get_kneighbors(network, 2)

# get 3-hop neighborhood of second node
get_kneighbors(network, 2, k = 3)




