library(FactoInvestigate)


### Name: graphSup
### Title: Supplementary variables factor map
### Aliases: graphSup
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
graphSup(res.pca)



