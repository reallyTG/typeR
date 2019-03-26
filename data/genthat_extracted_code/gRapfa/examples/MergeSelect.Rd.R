library(gRapfa)


### Name: MergeSelect
### Title: Selection of nodes to merged at a level
### Aliases: MergeSelect

### ** Examples

data(Wheeze)
G <- st(Wheeze)
G <- contract.last.level(G)
G1 <- MergeSelect(G, this.level=3)
G <- G1$G
G$layout <- getXY(G)
plot(G)



