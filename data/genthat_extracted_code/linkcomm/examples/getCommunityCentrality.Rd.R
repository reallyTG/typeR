library(linkcomm)


### Name: getCommunityCentrality
### Title: Calculate Community Centrality Measures for Nodes
### Aliases: getCommunityCentrality

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Calculate community centrality.
cc <- getCommunityCentrality(lc)

## Calculate community centrality using "commconn" measure.
cc <- getCommunityCentrality(lc, type = "commconn")



