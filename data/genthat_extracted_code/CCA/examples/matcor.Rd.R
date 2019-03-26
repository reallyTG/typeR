library(CCA)


### Name: matcor
### Title: Correlations matrices
### Aliases: matcor
### Keywords: multivariate

### ** Examples

data(nutrimouse)
X=as.matrix(nutrimouse$gene)
Y=as.matrix(nutrimouse$lipid)
correl=matcor(X,Y)
img.matcor(correl)
img.matcor(correl,type=2)



