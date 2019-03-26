library(memnet)


### Name: rw_graph
### Title: Create random walk graph
### Aliases: rw_graph

### ** Examples


# get animal fluency data
data(animal_fluency)

# infer influence network
inferred_network = rw_graph(animal_fluency)

# Simulate -----

# generate watts strogatz graph
network = grow_ws(n = 200, k = 10, p = .5)

# generate fluency data
# sets string equal TRUE as community_graph expects mode character
fluency_data = fluency(get_adjlist(network), rep(10, 100), string = TRUE)

# infer fluency network
inferred_network = rw_graph(fluency_data)




