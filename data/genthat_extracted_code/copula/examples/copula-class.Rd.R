library(copula)


### Name: copula-class
### Title: Mother Classes "Copula", etc of all Copulas in the Package
### Aliases: copula-class Copula-class dimCopula-class parCopula-class
###   xcopula-class dim,copula-method dim,xcopula-method
###   dim,dimCopula-method
### Keywords: classes

### ** Examples

hc <- evCopula("husler", 1.25)
dim(hc)
smoothScatter(u <- rCopula(2^11, hc))
lambda   (hc)
tau (hc)
rho(hc)
str(hc)



