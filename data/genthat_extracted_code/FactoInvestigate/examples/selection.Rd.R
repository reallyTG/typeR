library(FactoInvestigate)


### Name: selection
### Title: Graphical elements selection
### Aliases: selection
### Keywords: selection

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
selection(res.pca, margin = 1, selec = "contrib 10")



