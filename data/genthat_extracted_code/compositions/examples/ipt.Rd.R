library(compositions)


### Name: ipt
### Title: Isometric planar transform
### Aliases: ipt iptInv uciptInv
### Keywords: multivariate

### ** Examples

(tmp <- ipt(c(1,2,3)))
iptInv(tmp)
iptInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(ipt(cdata)) 



