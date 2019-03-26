library(gRapfa)


### Name: add.stats
### Title: Add attributes to an APFA
### Aliases: add.stats

### ** Examples

library(gRapfa)
data(Wheeze)
G <- st(Wheeze)
G.as1 <- add.stats(G)
G.c <- contract.last.level(G)
G.as2 <- add.stats(G.c)



