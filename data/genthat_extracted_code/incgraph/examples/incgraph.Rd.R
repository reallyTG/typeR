library(incgraph)


### Name: incgraph
### Title: IncGraph: incremental graphlet counting for network optimisation
### Aliases: incgraph incgraph-package

### ** Examples

# Create a new (empty) network with 4 nodes
net <- new.incgraph.network(amnt.nodes = 4)

# Create a new network with 4 nodes and some edges
net <- new.incgraph.network(links = matrix(c(1, 2, 2, 3, 1, 4), ncol=2))

# Create a new network with 10 nodes and some edges
net <- new.incgraph.network(amnt.nodes = 10, links = matrix(c(1, 2, 2, 3, 1, 4), ncol=2))

# Create a more complex network from a matrix
mat <- matrix(c(1, 2,
                1, 3,
                1, 4,
                1, 5,
                1, 6,
                1, 7,
                2, 7,
                2, 8,
                2, 9,
                2, 10), ncol=2)
net <- new.incgraph.network(links=mat)
# Calculate the initial orbit counts using orca
orb.counts <- calculate.orbit.counts(net)
# Modify an edge and calculate the differences in orbit counts
flip(net, 5, 10) # add (5,10)
delta1 <- calculate.delta(net, 5, 10)
# Modify another edge
flip(net, 6, 10) # add (6, 10)
delta2 <- calculate.delta(net, 6, 10)
# And another
flip(net, 1, 5)  # remove (1, 5)
delta3 <- calculate.delta(net, 1, 5)
# Verify that the new orbit counts equals the old orbit counts plus the delta counts
new.orb.counts.incremental <- orb.counts +
  delta1$add - delta1$rem +
  delta2$add - delta2$rem +
  delta3$add - delta3$rem
new.orb.counts <- calculate.orbit.counts(net)
all(new.orb.counts.incremental == new.orb.counts) # TRUE

## Additional helper functions
# Transform the network to a matrix
network.as.matrix(net)
# Get all neighbours of a node
get.neighbours(net, 1)
# Does the network contain a specific interaction?
contains(net, 5, 10)
contains(net, 7, 10)
# Reinitialise to an empty network
reset(net)
network.as.matrix(net)




