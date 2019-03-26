library(compositions)


### Name: apt
### Title: Additive planar transform
### Aliases: apt aptInv
### Keywords: multivariate

### ** Examples

(tmp <- apt(c(1,2,3)))
aptInv(tmp)
aptInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(apt(cdata),pch=".") 



