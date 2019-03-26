library(Compositional)


### Name: Inverse of the alpha-transformation
### Title: Inverse of the alpha-transformation
### Aliases: alfainv
### Keywords: \alpha -transformation inverse transformation

### ** Examples

library(MASS)
x <- as.matrix(fgl[1:10, 2:9])
x <- x / rowSums(x)
y <- alfa(x, 0.5)$aff
alfainv(y, 0.5)



