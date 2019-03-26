library(FactoMineR)


### Name: reconst
### Title: Reconstruction of the data from the PCA, CA or MFA results
### Aliases: reconst
### Keywords: multivariate

### ** Examples

data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13, graph=FALSE)
rec <- reconst(res.pca,ncp=2)



