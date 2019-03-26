library(FactoInvestigate)


### Name: graphHab
### Title: Colored factor graph
### Aliases: graphHab
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
graphHab(res.pca)



