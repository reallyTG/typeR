library(treeplyr)


### Name: filterMatrix
### Title: Filter a matrix, returning either all continuous or all discrete
###   characters
### Aliases: filterMatrix

### ** Examples

data(anolis)
aType<-detectAllCharacters(anolis$dat)
filterMatrix(anolis$dat, aType, "discrete")



