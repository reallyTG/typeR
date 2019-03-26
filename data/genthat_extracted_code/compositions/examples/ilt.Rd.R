library(compositions)


### Name: ilt
### Title: Isometric log transform
### Aliases: ilt iltInv
### Keywords: multivariate

### ** Examples

(tmp <- ilt(c(1,2,3)))
iltInv(tmp)
iltInv(tmp) - c(1,2,3) # 0
data(Hydrochem)
cdata <- Hydrochem[,6:19]
pairs(ilt(cdata)) 



