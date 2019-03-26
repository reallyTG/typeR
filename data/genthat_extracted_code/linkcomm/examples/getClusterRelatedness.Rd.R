library(linkcomm)


### Name: getClusterRelatedness
### Title: Hierarchichal Clustering of Link Communities
### Aliases: getClusterRelatedness

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Cluster the link communities.
getClusterRelatedness(lc)

## Cluster the link communities, cut the dendrogram, and return the meta-communities.
getClusterRelatedness(lc, cutat = 1)



