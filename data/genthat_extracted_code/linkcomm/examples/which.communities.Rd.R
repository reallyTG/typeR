library(linkcomm)


### Name: which.communities
### Title: Extract Community Membership for Nodes
### Aliases: which.communities

### ** Examples

## Generate graph and extract OCG communities.
g <- swiss[,3:4]
oc <- getOCG.clusters(g)

## Get edges from community 1.
which.communities(oc, nodes = 1)



