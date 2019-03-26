library(spider)


### Name: ordinDNA
### Title: Calculates a Principal Components Ordination of genetic
###   distances
### Aliases: ordinDNA
### Keywords: Barcoding

### ** Examples



data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloOrd <- ordinDNA(doloDist, doloSpp)
doloOrd




