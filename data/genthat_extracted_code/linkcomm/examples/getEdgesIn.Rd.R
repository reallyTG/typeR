library(linkcomm)


### Name: getEdgesIn
### Title: Extract Edge Indices from Communities
### Aliases: getEdgesIn

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get edges from community 1.
getEdgesIn(lc)



