library(lfl)


### Name: mult
### Title: Callback-based Multiplication of Matrices
### Aliases: mult
### Keywords: models robust multivariate

### ** Examples

    x <- matrix(runif(24, -100, 100), ncol=6)
    y <- matrix(runif(18, -100, 100), nrow=6)

    mult(x, y, function(xx, yy) sum(xx * yy)) # the same as "x %*% y"



