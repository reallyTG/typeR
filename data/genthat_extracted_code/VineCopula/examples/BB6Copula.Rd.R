library(VineCopula)


### Name: BB6Copula
### Title: Constructor of the BB6 Family and Rotated Versions thereof
### Aliases: BB6Copula surBB6Copula r90BB6Copula r270BB6Copula

### ** Examples


library(copula)

persp(BB6Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(surBB6Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(r90BB6Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))
persp(r270BB6Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))




