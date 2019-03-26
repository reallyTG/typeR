library(linkcomm)


### Name: newLinkCommsAt
### Title: User-Defined Link Communities
### Aliases: newLinkCommsAt

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## User defined communities.
lc2 <- newLinkCommsAt(lc, cutat = 0.8)



