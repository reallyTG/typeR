library(pergola)


### Name: sortLeafs
### Title: Chromosome wise leaf ordering
### Aliases: sortLeafs

### ** Examples

data(simTetra)
simTetrageno <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetrageno, 4)
split <- splitChr(rfMat, nchr = 7)
sortLeafs(rfMat, split)



