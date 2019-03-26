library(tensorBSS)


### Name: tPCA
### Title: PCA for Tensor-Valued Observations
### Aliases: tPCA
### Keywords: multivariate array

### ** Examples

# Digit data example

library(ElemStatLearn)
x <- zip.train

rows <- which(x[, 1] == 0 | x[, 1] == 1)
x0 <- x[rows, 2:257]
y0 <- x[rows, 1] + 1

x0 <- t(x0)
dim(x0) <- c(16, 16, 2199)


tpca <- tPCA(x0, d = c(2, 2))
pairs(t(apply(tpca$S, 3, c)), col=y0)



