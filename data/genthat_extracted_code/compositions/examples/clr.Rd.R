library(compositions)


### Name: clr
### Title: Centered log ratio transform
### Aliases: clr clrInv
### Keywords: multivariate

### ** Examples

(tmp <- clr(c(1,2,3)))
clrInv(tmp)
clrInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(clr(cdata),pch=".") 



