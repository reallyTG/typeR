library(interep)


### Name: interep
### Title: fit a generalized estimating equation with given lambda
### Aliases: interep

### ** Examples

data("dat")
e=dat$e
z=dat$z
y=dat$y
beta=dat$beta
lam1=dat$lam1
lam2=dat$lam2
index=dat$index
b = interep(e, z, y, beta, lam1, lam2, corre='e',maxits=30)
b[abs(b)<0.05]=0
pos = which(b != 0)
tp = length(intersect(index, pos))
fp = length(pos) - tp
list(tp=tp, fp=fp)




