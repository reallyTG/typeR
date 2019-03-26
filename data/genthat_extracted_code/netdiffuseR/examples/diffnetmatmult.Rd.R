library(netdiffuseR)


### Name: %*%
### Title: Matrix multiplication
### Aliases: %*% %*%.default %*%.diffnet

### ** Examples

# Finding the Simmelian Ties network ----------------------------------------

# Random diffnet graph
set.seed(773)
net <- rdiffnet(100, 4, seed.graph='small-world', rgraph.args=list(k=8))
netsim <- net

# According to Dekker (2006), Simmelian ties can be computed as follows
netsim <- net * t(net) # Keeping mutal
netsim <- netsim * (netsim %*% netsim)

# Checking out differences (netsim should have less)
nlinks(net)
nlinks(netsim)

mapply(`-`, nlinks(net), nlinks(netsim))




