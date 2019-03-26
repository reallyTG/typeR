library(RClone)


### Name: zostera
### Title: Zostera Dataset
### Aliases: zostera
### Keywords: datasets

### ** Examples

data(zostera)
popvec <- zostera[,1]
coord_zostera <- zostera[,2:3]
zostera <- convert_GC(zostera[,4:ncol(zostera)], 3)



