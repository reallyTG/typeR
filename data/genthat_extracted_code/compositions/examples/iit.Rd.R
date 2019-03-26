library(compositions)


### Name: iit
### Title: Isometric identity transform
### Aliases: iit iitInv
### Keywords: multivariate

### ** Examples

(tmp <- iit(c(1,2,3)))
iitInv(tmp)
iitInv(tmp) - c(1,2,3) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(iit(cdata)) 



