library(FactoInvestigate)


### Name: outliers
### Title: Outliers detection
### Aliases: outliers
### Keywords: outlier

### ** Examples

require(FactoMineR)
data(decathlon)
res.pca = PCA(decathlon, quanti.sup = c(11:12), quali.sup = c(13), graph = FALSE)
outliers(res.pca, file = "PCA.Rmd")



