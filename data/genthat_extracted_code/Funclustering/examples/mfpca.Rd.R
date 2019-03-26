library(Funclustering)


### Name: mfpca
### Title: Multivariate functional pca
### Aliases: mfpca

### ** Examples

data(growth)
data=cbind(matrix(growth$hgtm,31,39),matrix(growth$hgtf,31,54));
t=growth$age;
splines <- create.bspline.basis(rangeval=c(1, max(t)), nbasis = 20,norder=4);
fd <- Data2fd(data, argvals=t, basisobj=splines);
pca=mfpca(fd,nharm=2)
summary(pca)



