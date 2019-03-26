library(pergola)


### Name: splitChr
### Title: Split markers into chromosomes
### Aliases: splitChr

### ** Examples

data(simTetra)
simTetrageno<-bases2genotypes(simTetra, 4)
rfMat<-calcRec(simTetrageno, 4)
splitChr(rfMat, nchr = 7)



