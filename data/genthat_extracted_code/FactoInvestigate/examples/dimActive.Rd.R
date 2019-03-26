library(FactoInvestigate)


### Name: dimActive
### Title: Number of active dimensions
### Aliases: dimActive
### Keywords: dimension

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
dimActive(res.pca)



