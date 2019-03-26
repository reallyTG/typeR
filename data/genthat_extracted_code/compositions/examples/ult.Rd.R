library(compositions)


### Name: ult
### Title: Uncentered log transform
### Aliases: ult ultInv Kappa
### Keywords: multivariate

### ** Examples

(tmp <- ult(c(1,2,3)))
ultInv(tmp)
ultInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(ult(cdata),pch=".")
Kappa(c(1,2,3))



