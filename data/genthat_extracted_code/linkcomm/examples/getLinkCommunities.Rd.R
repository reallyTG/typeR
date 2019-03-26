library(linkcomm)


### Name: getLinkCommunities
### Title: Extract Link Communities from a Network
### Aliases: getLinkCommunities

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Extract communities by writing a temporary file to disk.
lc <- getLinkCommunities(g, edglim = 10)

## Use similarities between all pairs of edges.
lc <- getLinkCommunities(g, use.all.edges = TRUE)

## Directed network.
lc <- getLinkCommunities(g, directed = TRUE, dirweight = 0.8)

## Weighted network.
g <- cbind(swiss[,3:4], runif(nrow(swiss[,3:4])))
lc <- getLinkCommunities(g)

## Directed and weighted network.
lc <- getLinkCommunities(g, directed = TRUE, dirweight = 0.8)




