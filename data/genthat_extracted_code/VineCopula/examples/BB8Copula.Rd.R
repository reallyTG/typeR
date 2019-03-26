library(VineCopula)


### Name: BB8Copula
### Title: Constructor of the BB8 Family and Rotated Versions thereof
### Aliases: BB8Copula surBB8Copula r90BB8Copula r270BB8Copula

### ** Examples


library(copula)

persp(BB8Copula(c(2,0.9)), dCopula, zlim = c(0,10))
persp(surBB8Copula(c(2,0.9)), dCopula, zlim = c(0,10))
persp(r90BB8Copula(c(-2,-0.9)), dCopula, zlim = c(0,10))
persp(r270BB8Copula(c(-2,-0.9)), dCopula, zlim = c(0,10))




