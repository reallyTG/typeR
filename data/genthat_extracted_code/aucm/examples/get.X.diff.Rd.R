library(aucm)


### Name: get.X.diff
### Title: get.X.diff
### Aliases: get.X.diff get.X.diff.default get.X.diff.formula

### ** Examples


dat = sim.dat.1(n=100,seed=1)
X1 = as.matrix(subset(dat, y==0, select=c(x1,x2)))
X2 = as.matrix(subset(dat, y==1, select=c(x1,x2)))
X.diff = get.X.diff (X1, X2)
dim(X1)
dim(X2)
dim(X.diff)





