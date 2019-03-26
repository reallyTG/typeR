library(gRapfa)


### Name: apfa2NS
### Title: APFA to node symbol array
### Aliases: apfa2NS

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
G.c <- contract.last.level(G)
ns.array <- apfa2NS(G.c)



