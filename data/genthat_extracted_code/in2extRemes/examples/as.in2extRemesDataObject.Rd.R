library(in2extRemes)


### Name: as.in2extRemesDataObject
### Title: Convert Data Frame Object to in2extRemes Data Object
### Aliases: as.in2extRemesDataObject
### Keywords: manip list

### ** Examples


look <- apply(matrix(rnorm(100 * 100), 100, 100), 2, max, na.rm = TRUE)
look2 <- as.in2extRemesDataObject(look)




