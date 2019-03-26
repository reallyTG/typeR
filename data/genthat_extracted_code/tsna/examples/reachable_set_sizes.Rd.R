library(tsna)


### Name: tReach
### Title: computes sizes of temporally reachable sets in a dynamicNetwork
### Aliases: tReach

### ** Examples

data(moodyContactSim)
tReach(moodyContactSim)

# only sample 3 paths
tReach(moodyContactSim,sample=3)

# what fraction of the network could each vertex reach?
tReach(moodyContactSim)/network.size(moodyContactSim)

# what fraction of the network could each vertex be reached by?
tReach(moodyContactSim,direction='bkwd')/network.size(moodyContactSim)



