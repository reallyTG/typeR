library(gRapfa)


### Name: MergeNodes
### Title: Merge given node set of an APFA
### Aliases: MergeNodes

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
G.c <- contract.last.level(G)
G.m <- MergeNodes(G.c, c(5,3))



