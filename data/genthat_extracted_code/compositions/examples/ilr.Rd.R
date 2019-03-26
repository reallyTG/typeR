library(compositions)


### Name: ilr
### Title: Isometric log ratio transform
### Aliases: ilr ilrInv
### Keywords: multivariate

### ** Examples

(tmp <- ilr(c(1,2,3)))
ilrInv(tmp)
ilrInv(tmp) - clo(c(1,2,3)) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(ilr(cdata))
ilrBase(D=3) 



