library(simex)


### Name: diag.block
### Title: Constructs a block diagonal matrix
### Aliases: diag.block

### ** Examples

a <- matrix(rep(1, 4), nrow = 2)
b <- matrix(rep(2, 6), nrow = 2)
e <- c(3, 3, 3, 3)
f <- t(e)
d <- list(a, b, e, f)
diag.block(d)
diag.block(a, 3)




