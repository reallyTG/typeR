library(linkcomm)


### Name: get.community.overlaps
### Title: Find Node Overlaps between Communities
### Aliases: get.community.overlaps

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get list of overlapping communities.
ov <- get.community.overlaps(lc)



