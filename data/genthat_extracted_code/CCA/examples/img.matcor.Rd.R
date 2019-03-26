library(CCA)


### Name: img.matcor
### Title: Image of correlation matrices
### Aliases: img.matcor
### Keywords: dplot

### ** Examples

data(nutrimouse)
X=as.matrix(nutrimouse$gene)
Y=as.matrix(nutrimouse$lipid)
correl=matcor(X,Y)
img.matcor(correl)
img.matcor(correl,type=2)



