library(ergm)


### Name: network.update
### Title: Replace the sociomatrix in a network object
### Aliases: network.update
### Keywords: models

### ** Examples


#
data(florentine)
#
# test the network.update function
#
# Create a Bernoulli network
rand.net <- network(network.size(flomarriage))
# store the sociomatrix 
rand.mat <- rand.net[,]
# Update the network
network.update(flomarriage, rand.mat, matrix.type="adjacency")
# Try this with an edgelist
rand.mat <- as.matrix.network.edgelist(flomarriage)[1:5,]
network.update(flomarriage, rand.mat, matrix.type="edgelist")




