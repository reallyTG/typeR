library(pergola)


### Name: map2dend
### Title: Transforming a map into a dendrogram
### Aliases: map2dend

### ** Examples

data(simTetra)
simTetrageno <- bases2genotypes(simTetra, 4)
rfMat <- calcRec(simTetrageno, 4)
split <- splitChr(rfMat, nchr = 7)
split <- sortLeafs(rfMat, split)
map <- pullMap(rfMat, split = split)   
dend <- map2dend(map)  
plot(dend)



