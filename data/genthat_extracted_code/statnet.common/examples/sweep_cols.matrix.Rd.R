library(statnet.common)


### Name: sweep_cols.matrix
### Title: Suptract a elements of a vector from respective columns of a
###   matrix
### Aliases: sweep_cols.matrix

### ** Examples


x <- matrix(runif(1000), ncol=4)
s <- 1:4

stopifnot(all.equal(sweep_cols.matrix(x, s), sweep(x, 2, s)))




