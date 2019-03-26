library(linkcomm)


### Name: getCommunityMatrix
### Title: Construct a Community Membership Matrix
### Aliases: getCommunityMatrix

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get community membership matrix.
getCommunityMatrix(lc)



