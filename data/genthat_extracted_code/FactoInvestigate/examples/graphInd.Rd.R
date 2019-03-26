library(FactoInvestigate)


### Name: graphInd
### Title: Individuals factor map
### Aliases: graphInd
### Keywords: graphs

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
graphInd(res.pca)



