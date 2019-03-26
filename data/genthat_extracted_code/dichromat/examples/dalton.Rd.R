library(dichromat)


### Name: dalton
### Title: Effects of Daltonism (Red-Green Color Blindness)
### Aliases: dalton dalton.colors
### Keywords: datasets

### ** Examples

 data("dalton", package = "dichromat")
 par(mfrow = c(4, 1))
 image(matrix(1:256, 128), col = dalton.colors$normal)
 image(matrix(1:256, 128), col = dalton.colors$deutan)
 image(matrix(1:256, 128), col = dalton.colors$protan)
 image(matrix(1:256, 128), col = dalton.colors$tritan)



