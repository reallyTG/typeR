library(memnet)


### Name: threshold_graph
### Title: Create threshold graph
### Aliases: threshold_graph

### ** Examples


# get animal fluency data
data(animal_fluency)

# infer influence network
inferred_network = threshold_graph(animal_fluency)

# Simulate -----

# generate watts strogatz graph
network = grow_ws(n = 200, k = 10, p = .5)

# generate fluency data
# sets string equal TRUE as community_graph expects mode character
fluency_data = fluency(get_adjlist(network), rep(10, 100), string = TRUE)

# infer fluency network
inferred_network = threshold_graph(fluency_data)




