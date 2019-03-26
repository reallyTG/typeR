library(linkcomm)


### Name: plotLinkCommMembers
### Title: Plot a Community Membership Matrix for Link Communities
### Aliases: plotLinkCommMembers

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot a community membership matrix.
plot(lc, type = "members")



