library(FactoMineR)


### Name: graph.var
### Title: Make graph of variables
### Aliases: graph.var
### Keywords: dplot

### ** Examples

data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup = 13, graph = FALSE)
graph.var (res.pca, draw = c("var","Points"), 
    label = c("Long.jump", "Points"))



