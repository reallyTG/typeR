library(gnm)


### Name: Symm
### Title: Symmetric Interaction of Factors
### Aliases: Symm
### Keywords: models

### ** Examples

rowfac <- gl(4, 4, 16)
colfac <- gl(4, 1, 16)
symm4by4 <- Symm(rowfac, colfac)
matrix(symm4by4, 4, 4)



