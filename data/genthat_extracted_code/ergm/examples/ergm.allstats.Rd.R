library(ergm)


### Name: ergm.allstats
### Title: Calculate all possible vectors of statistics on a network for an
###   ERGM
### Aliases: ergm.allstats
### Keywords: models

### ** Examples


# Count by brute force all the edge statistics possible for a 7-node 
# undirected network
mynw <- network(matrix(0,7,7),dir=FALSE)
system.time(a <- ergm.allstats(mynw~edges))

# Summarize results
rbind(t(a$statmat),a$weights)

# Each value of a$weights is equal to 21-choose-k, 
# where k is the corresponding statistic (and 21 is 
# the number of dyads in an 7-node undirected network).  
# Here's a check of that fact:
as.vector(a$weights - choose(21, t(a$statmat)))

# Simple ergm.exact outpuf for this network.  
# We know that the loglikelihood for my empty 7-node network
# should simply be -21*log(1+exp(eta)), so we may check that
# the following two values agree:
-21*log(1+exp(.1234)) 
ergm.exact(.1234, mynw~edges, statmat=a$statmat, weights=a$weights)




