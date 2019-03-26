library(linkcomm)


### Name: getCommunityConnectedness
### Title: Calculate Community Connectedness or Modularity
### Aliases: getCommunityConnectedness

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get community connectedness.
cc <- getCommunityConnectedness(lc)

## Get community modularity.
cm <- getCommunityConnectedness(lc, conn = "mod")



