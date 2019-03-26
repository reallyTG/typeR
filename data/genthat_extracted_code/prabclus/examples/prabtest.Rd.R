library(prabclus)


### Name: prabtest
### Title: Parametric bootstrap test for clustering in presence-absence
###   matrices
### Aliases: prabtest summary.prabtest print.summary.prabtest
### Keywords: cluster spatial

### ** Examples

options(digits=4)
data(kykladspecreg)
data(nb)
set.seed(1234)
x <- prabinit(prabmatrix=kykladspecreg, neighborhood=nb)
# If you want to use your own ASCII data files, use
# x <- prabinit(file="path/prabmatrixfile",
# neighborhood="path/neighborhoodfile")
kpt <- prabtest(x, times=5, pd=0.35)
# These settings are chosen to make the example execution
# a bit faster; usually you will use prabtest(kprab).
summary(kpt)



