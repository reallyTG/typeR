library(Compositional)


### Name: The additive log-ratio transformation and its inverse
### Title: The additive log-ratio transformation and its inverse
### Aliases: alr alrinv
### Keywords: Additive log-ratio-transformation

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
y <- alr(x)
x1 <- alrinv(y)



