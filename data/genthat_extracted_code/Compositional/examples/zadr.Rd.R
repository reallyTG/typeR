library(Compositional)


### Name: Zero adjusted Dirichlet regression
### Title: Zero adjusted Dirichlet regression
### Aliases: zadr mixreg

### ** Examples

x <- as.vector(iris[, 4])
y <- as.matrix(iris[, 1:3])
y <- y / rowSums(y)
mod1 <- diri.reg(y, x)
y[sample(1:450, 15) ] <- 0
mod2 <- zadr(y, x)



