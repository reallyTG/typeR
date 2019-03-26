library(linkcomm)


### Name: plotLinkCommSumm
### Title: Plot a Summary of the Link Community Algorithm Output
### Aliases: plotLinkCommSumm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot the modularity of the link communities.
plot(lc, type = "summary")



