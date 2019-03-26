library(FactoInvestigate)


### Name: whichFacto
### Title: Analysis class
### Aliases: whichFacto
### Keywords: class

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
whichFacto(res.pca)



