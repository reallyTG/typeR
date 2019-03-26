library(spider)


### Name: sppDistMatrix
### Title: Mean intra- and inter-specific distance matrix
### Aliases: sppDistMatrix
### Keywords: Barcoding

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

sppDistMatrix(doloDist, doloSpp)





