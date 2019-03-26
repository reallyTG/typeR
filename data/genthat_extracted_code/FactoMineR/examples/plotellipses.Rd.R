library(FactoMineR)


### Name: plotellipses
### Title: Draw confidence ellipses around the categories
### Aliases: plotellipses
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(poison)
##D res.mca = MCA(poison, quali.sup = 3:4, quanti.sup = 1:2)
##D plotellipses(res.mca)
##D plotellipses(res.mca,keepvar=3:6)
## End(Not run)

data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13)
plotellipses(res.pca,keepvar=13)



