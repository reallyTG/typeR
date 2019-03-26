library(EpiModel)


### Name: init_pids
### Title: Persistent ID Initialization
### Aliases: init_pids
### Keywords: internal netMod

### ** Examples

# Initialize network with 25 female and 75 male
nw <- network.initialize(100, bipartite = 25)

# Set persistent IDs using the default F/M prefix
nw <- init_pids(nw)
nw %v% "vertex.names"

# Use another prefix combination
nw <- init_pids(nw, c("A", "B"))
nw %v% "vertex.names"




