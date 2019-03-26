library(linkcomm)


### Name: plot.linkcomm
### Title: The 'linkcomm' Plotting Function
### Aliases: plot.linkcomm

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot a graph of link communities.
plot(lc, type = "graph")



