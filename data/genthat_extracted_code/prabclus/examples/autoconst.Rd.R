library(prabclus)


### Name: autoconst
### Title: Spatial autocorrelation parameter estimation
### Aliases: autoconst autoreg
### Keywords: spatial

### ** Examples

options(digits=4)
data(kykladspecreg)
data(nb)
set.seed(1234)
x <- prabinit(prabmatrix=kykladspecreg, neighborhood=nb)
ax <- autoconst(x,nperp=2,step1=0.3,twostep=FALSE)



