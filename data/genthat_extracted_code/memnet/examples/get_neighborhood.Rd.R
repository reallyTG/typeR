library(memnet)


### Name: get_neighborhood
### Title: Get neighbors 'k' or fewer steps away
### Aliases: get_neighborhood

### ** Examples


# generate watts strogatz graph
network = grow_ws(n = 100, k = 10, p = .5)

# get neighborhood of second node
get_neighborhood(network, 2)

# get 3-hop neighborhood of second node
get_neighborhood(network, 2, k = 3)




