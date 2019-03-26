library(pergola)


### Name: swapChrs
### Title: Swap chromosomes
### Aliases: swapChrs

### ** Examples

data(simTetra)
simTetrageno <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetrageno, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
map <- pullMap(rfMat, split = split)   
split <- sortLeafs(rfMat, split, method = "endlink")
map2 <- pullMap(rfMat, split = split)   
map <- swapChrs(map, map2)



