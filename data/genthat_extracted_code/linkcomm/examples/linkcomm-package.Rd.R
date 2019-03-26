library(linkcomm)


### Name: linkcomm-package
### Title: The 'linkcomm' package
### Aliases: linkcomm-package linkcomm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot a graph layout of the link communities.
plot(lc, type = "graph")

## Use a Spencer circle layout.
plot(lc, type = "graph", layout = "spencer.circle")

## Calculate a community-based measure of node centrality.
getCommunityCentrality(lc)

## Find nested communities.
getAllNestedComm(lc)

## Uncover the relatedness between communities.
getClusterRelatedness(lc)



