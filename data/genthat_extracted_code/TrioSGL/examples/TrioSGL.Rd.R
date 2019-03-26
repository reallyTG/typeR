library(TrioSGL)


### Name: TrioSGL
### Title: Trio Model with a Combination of Lasso and Group Lasso
###   Regularization
### Aliases: TrioSGL
### Keywords: trio model regression

### ** Examples

trios <- 4 * 10; snps <- 20; size.groups <- 4
index <- ceiling(1:snps / size.groups)
x <- floor(matrix(runif(trios * snps, min = 0, max = 3), ncol = snps, nrow = trios))
fit <- TrioSGL(x, index)



