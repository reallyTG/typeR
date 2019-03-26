library(VineCopula)


### Name: BB7Copula
### Title: Constructor of the BB7 Family and Rotated Versions thereof
### Aliases: BB7Copula surBB7Copula r90BB7Copula r270BB7Copula

### ** Examples


library(copula)

persp(BB7Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(surBB7Copula(c(1,1.5)), dCopula, zlim = c(0,10))
persp(r90BB7Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))
persp(r270BB7Copula(c(-1,-1.5)), dCopula, zlim = c(0,10))




