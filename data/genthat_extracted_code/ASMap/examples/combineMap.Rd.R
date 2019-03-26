library(ASMap)


### Name: combineMap
### Title: Combine linkage maps from multiple 'qtl' cross objects
### Aliases: combineMap
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## create copy of mapDH with some different linkage groups
## and change marker names so they are unique

mapDH1 <- mapDH
names(mapDH1$geno)[5:14] <- paste("L",1:10, sep = "")
mapDH1$geno <- lapply(mapDH1$geno, function(el){
    nam <- paste(names(el$map), "A", sep = "")
    names(el$map) <- dimnames(el$data)[[2]] <- nam
    el})

mapDHc <- combineMap(mapDH, mapDH1)
nmar(mapDHc)



