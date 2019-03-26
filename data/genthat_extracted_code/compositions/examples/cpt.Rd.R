library(compositions)


### Name: cpt
### Title: Centered planar transform
### Aliases: cpt cptInv
### Keywords: multivariate

### ** Examples

(tmp <- cpt(c(1,2,3)))
cptInv(tmp)
cptInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(cpt(cdata),pch=".") 



