library(linkcomm)


### Name: orderCommunities
### Title: Order Link Communities According to the Dendrogram
### Aliases: orderCommunities

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Order communities according to the dendrogram.
orderCommunities(lc)



