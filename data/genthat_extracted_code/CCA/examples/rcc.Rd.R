library(CCA)


### Name: rcc
### Title: Regularized Canonical Correlation Analysis
### Aliases: rcc
### Keywords: multivariate

### ** Examples

data(nutrimouse)
X=as.matrix(nutrimouse$gene)
Y=as.matrix(nutrimouse$lipid)
res.cc=rcc(X,Y,0.1,0.2)
plt.cc(res.cc)



