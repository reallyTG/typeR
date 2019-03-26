library(psy)


### Name: psy
### Title: Various procedures used in psychometry
### Aliases: psy
### Keywords: package

### ** Examples

data(sleep)
sphpca(sleep[,c(2:5,7:11)])
data(expsy)
scree.plot(expsy[,1:10],simu=20,use="P")
data(ehd)
par(mfrow=c(1,5))
mtmm(ehd,list(c("e15","e18","e19","e20"),c("e4","e5","e6","e14","e17"),c("e11","e13","e16")
,c("e1","e10","e12"),c("e2","e3","e7","e8","e9")))



