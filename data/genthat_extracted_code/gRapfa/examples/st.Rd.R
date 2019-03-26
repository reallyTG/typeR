library(gRapfa)


### Name: st
### Title: Sample tree
### Aliases: st

### ** Examples

data(Wheeze)
G <- st(Wheeze)
E(G)$arrow.size <- 0.6
V(G)$size <- 10
V(G)$label <- ''
E(G)$label <- E(G)$count
plot(G)



