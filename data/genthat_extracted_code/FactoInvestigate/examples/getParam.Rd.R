library(FactoInvestigate)


### Name: getParam
### Title: Factorial parameters
### Aliases: getParam
### Keywords: parameter

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
getParam(res.pca)



