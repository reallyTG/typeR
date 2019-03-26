library(CCA)


### Name: cc
### Title: Canonical Correlation Analysis
### Aliases: cc
### Keywords: multivariate

### ** Examples

data(nutrimouse)
X=as.matrix(nutrimouse$gene[,1:10])
Y=as.matrix(nutrimouse$lipid)
res.cc=cc(X,Y)
plot(res.cc$cor,type="b")
plt.cc(res.cc)



