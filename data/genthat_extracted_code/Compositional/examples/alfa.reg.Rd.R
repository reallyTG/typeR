library(Compositional)


### Name: Regression with compositional data using the alpha-transformation
### Title: Regression with compositional data using the
###   alpha-transformation
### Aliases: alfa.reg
### Keywords: \alpha -transformation multivariate regression

### ** Examples

library(MASS)
x <- as.vector(fgl[1:40, 1])
y <- as.matrix(fgl[1:40, 2:9])
y <- y / rowSums(y)
mod <- alfa.reg(y, x, 0.2)



