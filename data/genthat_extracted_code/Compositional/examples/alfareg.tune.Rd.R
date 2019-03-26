library(Compositional)


### Name: Tuning the value of alpha in the alpha-regression
### Title: Tuning the value of alpha in the alpha-regression
### Aliases: alfareg.tune
### Keywords: \alpha -transformation \alpha -regression

### ** Examples

library(MASS)
y <- as.matrix(fgl[1:40, 2:4])
y <- y /rowSums(y)
x <- as.vector(fgl[1:40, 1])
mod <- alfareg.tune(y, x, a = c(0.2, 0.35, 0.05), K = 5, nc = 1)



