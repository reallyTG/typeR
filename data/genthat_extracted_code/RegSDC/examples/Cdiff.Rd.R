library(RegSDC)


### Name: Cdiff
### Title: Matrix difference (a-b) including checking for equal columns
### Aliases: Cdiff
### Keywords: internal

### ** Examples

a <- matrix(rnorm(6), 3, 2)
b <- matrix(rnorm(6), 3, 2)
a - b
Cdiff(a, b)
b[, 1] <- a[, 1] + (.Machine$double.eps)^(2/3) * b[, 1]
a - b
Cdiff(a, b)
a[, 2] <- b[, 2]
a - b
Cdiff(a, b)



