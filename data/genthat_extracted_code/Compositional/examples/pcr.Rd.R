library(Compositional)


### Name: Principal components regression
### Title: Principal components regression
### Aliases: pcr
### Keywords: principal components linear regression

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
y <- as.vector(fgl[, 1])
mod1 <- pcr(y, x, 1)
mod2 <- pcr(y, x, 2)



