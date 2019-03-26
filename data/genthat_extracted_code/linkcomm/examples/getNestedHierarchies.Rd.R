library(linkcomm)


### Name: getNestedHierarchies
### Title: Find Nested Structures in Communities
### Aliases: getNestedHierarchies

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Determine if community 1 is nested in any other communities.
getNestedHierarchies(lc, clusid = 1)



