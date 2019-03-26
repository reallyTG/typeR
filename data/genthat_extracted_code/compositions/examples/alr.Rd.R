library(compositions)


### Name: alr
### Title: Additive log ratio transform
### Aliases: alr alrInv
### Keywords: multivariate

### ** Examples

(tmp <- alr(c(1,2,3)))
alrInv(tmp)
unclass(alrInv(tmp)) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(alr(cdata),pch=".")



