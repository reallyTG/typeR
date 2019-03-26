library(pergola)


### Name: calcSarf
### Title: Calculates the SARF value of given input.
### Aliases: calcSarf

### ** Examples

data(simTetra)
simTetrageno <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetrageno, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
calcSarf(rfMat, split$order, n = 1)
calcSarf(rfMat, split$order, n = 2)
calcSarf(rfMat, split$order, n = 3)



