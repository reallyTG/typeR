library(aucm)


### Name: ramp.f
### Title: ramp.f
### Aliases: ramp.f ramp.f

### ** Examples


dat = sim.dat.1(n=100,seed=1)
X1 = as.matrix(subset(dat, y==0, select=c(x1,x2)))
X2 = as.matrix(subset(dat, y==1, select=c(x1,x2)))
X.diff = get.X.diff (X1, X2)
dim(X1)
dim(X2)
dim(X.diff)
aux = ramp.f(X.diff %*% c(1,1), s=1)
length(aux)
mean(aux)
aux = ramp.f(X.diff %*% c(1,1), s=1, loss=FALSE)
length(aux)
mean(aux)




