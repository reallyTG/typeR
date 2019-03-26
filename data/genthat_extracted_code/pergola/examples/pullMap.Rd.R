library(pergola)


### Name: pullMap
### Title: Creates map object
### Aliases: pullMap

### ** Examples

data(simTetra)
simTetrageno <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetrageno, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
pullMap(rfMat, split = split)   



