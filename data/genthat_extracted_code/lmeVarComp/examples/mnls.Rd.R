library(lmeVarComp)


### Name: mnls
### Title: Minimum Norm Least Squares
### Aliases: mnls

### ** Examples

x <- matrix(rnorm(500L), 100L, 5L)
x <- cbind(x, x[, 1L] + x[, 2L], x[, 1L] - x[, 3L])
b <- -3L : 3L
y <- c(x %*% b)
mnls(x, y)  # different to b



