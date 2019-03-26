library(linkcomm)


### Name: getAllNestedComm
### Title: Find Nested Communities
### Aliases: getAllNestedComm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Find nested communities.
getAllNestedComm(lc)



