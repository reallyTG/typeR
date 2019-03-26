library(Funclustering)


### Name: plotfd
### Title: plot a functional data object
### Aliases: plotfd

### ** Examples

data(growth)
data=cbind(matrix(growth$hgtm,31,39),matrix(growth$hgtf,31,54));
t=growth$age;
splines <- create.bspline.basis(rangeval=c(1, max(t)), nbasis = 20,norder=4);
fd <- Data2fd(data, argvals=t, basisobj=splines);
cls=c(rep(1,39),rep(2,54)) #there is 39 boys and 54 girls in this data
plotfd(fd,col=cls)



