library(gRapfa)


### Name: merge2nodes
### Title: Merge two nodes
### Aliases: merge2nodes

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
G.c <- contract.last.level(G)
NS <- apfa2NS(G.c)
n2n <- merge2nodes(NS, c(5,3))



