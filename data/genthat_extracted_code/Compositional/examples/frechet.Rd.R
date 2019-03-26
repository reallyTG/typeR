library(Compositional)


### Name: The Frechet mean for compositional data
### Title: The Frechet mean for compositional data
### Aliases: frechet
### Keywords: \alpha -transformation Frechet mean

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
frechet(x, 0.2)
frechet(x, 1)



