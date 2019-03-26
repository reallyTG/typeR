library(linkcomm)


### Name: meta.communities
### Title: Produce a Set of Meta-Communities
### Aliases: meta.communities

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Produce meta-communities.
## Not run: mc <- meta.communities(lc)



