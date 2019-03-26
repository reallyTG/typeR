library(linkcomm)


### Name: corLinkcommCentrality
### Title: Correlation of Community Centrality with Classic Centrality
### Aliases: corLinkcommCentrality

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Correlate community centrality with degree centrality.
corLinkcommCentrality(lc)



