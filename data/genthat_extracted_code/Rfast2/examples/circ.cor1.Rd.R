library(Rfast2)


### Name: Circurlar correlations between two circular variables
### Title: Circurlar correlations between two circular variables
### Aliases: circ.cor1 circ.cors1

### ** Examples

y <- runif(50, 0, 2 * pi)
x <- runif(50, 0, 2 * pi)
circ.cor1(y, x, TRUE)
x <- matrix(runif(50 * 10, 0, 2 * pi), ncol = 10)
circ.cors1(y, x, TRUE)



