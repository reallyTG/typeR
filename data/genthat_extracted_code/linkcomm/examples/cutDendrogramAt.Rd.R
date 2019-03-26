library(linkcomm)


### Name: cutDendrogramAt
### Title: Extract Meta-Communities
### Aliases: cutDendrogramAt

### ** Examples

## Generate graph, extract link communities, and cluster communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)
hc <- getClusterRelatedness(lc)

## Cut dendrogram at 1 and extract meta-communities.
cutDendrogramAt(hc, cutat = 1)



