library(pergola)


### Name: maketangle
### Title: Create a gray scale tanglegram
### Aliases: maketangle

### ** Examples

data(simTetra)
simTetraGen <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetraGen, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
map <- pullMap(rfMat, split = split)  
dend <- map2dend(map)  
maketangle(dend, dend, cutheight = 500, k = 7, ncol = 7)



