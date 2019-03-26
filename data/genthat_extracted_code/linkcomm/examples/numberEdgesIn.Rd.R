library(linkcomm)


### Name: numberEdgesIn
### Title: Extract Node Community Membership by Edges
### Aliases: numberEdgesIn

### ** Examples

## Generate graph and extract OCG communities.
g <- swiss[,3:4]
oc <- getOCG.clusters(g)

## Get edges from community 1.
numberEdgesIn(oc, nodes = 1)



