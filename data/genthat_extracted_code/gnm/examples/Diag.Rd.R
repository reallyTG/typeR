library(gnm)


### Name: Diag
### Title: Equality of Two or More Factors
### Aliases: Diag
### Keywords: models

### ** Examples

rowfac <- gl(4, 4, 16)
colfac <- gl(4, 1, 16)
diag4by4 <- Diag(rowfac, colfac)
matrix(Diag(rowfac, colfac, binary = TRUE), 4, 4)



