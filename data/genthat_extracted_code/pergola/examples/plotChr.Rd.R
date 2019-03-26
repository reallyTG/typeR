library(pergola)


### Name: plotChr
### Title: Plotting one or two linkage maps
### Aliases: plotChr

### ** Examples

data(simTetra)
simTetraGen <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetraGen, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
map <- pullMap(rfMat, split = split) 
plotChr(map[[1]])  



