library(VineCopula)


### Name: BB1Copula
### Title: Constructor of the BB1 Family and Rotated Versions thereof
### Aliases: BB1Copula surBB1Copula r90BB1Copula r270BB1Copula
### Keywords: copula distribution

### ** Examples


library(copula)

persp(BB1Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(surBB1Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(r90BB1Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))
persp(r270BB1Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))




