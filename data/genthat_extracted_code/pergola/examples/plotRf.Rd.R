library(pergola)


### Name: plotRf
### Title: Plot recombination frequencies
### Aliases: plotRf

### ** Examples

data(simTetra)
simTetraGen <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetraGen, 4)
plotRf(rfMat)



