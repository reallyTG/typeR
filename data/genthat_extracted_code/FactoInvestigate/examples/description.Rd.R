library(FactoInvestigate)


### Name: description
### Title: Factorial dimensions description
### Aliases: description
### Keywords: description

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
description(res.pca, file = "PCA.Rmd", dim = 1:2)



