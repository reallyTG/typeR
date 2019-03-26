library(linkcomm)


### Name: plotLinkCommDend
### Title: Plot a Coloured Dendrogram of Link Communities
### Aliases: plotLinkCommDend

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot a coloured dendrogram.
plot(lc, type = "dend")



