library(Compositional)


### Name: Dirichlet regression
### Title: Dirichlet regression
### Aliases: diri.reg diri.reg2
### Keywords: Dirichlet regression multivariate regression

### ** Examples

x <- as.vector(iris[, 4])
y <- as.matrix(iris[, 1:3])
y <- y / rowSums(y)
mod1 <- diri.reg(y, x)
mod2 <-diri.reg2(y, x)
mod3 <- comp.reg(y, x)



