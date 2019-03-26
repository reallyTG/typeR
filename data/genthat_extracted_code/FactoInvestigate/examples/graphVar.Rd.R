library(FactoInvestigate)


### Name: graphVar
### Title: Variables factor map
### Aliases: graphVar
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
graphVar(res.pca)



