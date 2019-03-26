library(DNMF)


### Name: ndNMF
### Title: a new discriminant Non-Negative Matrix Factorization (dNMF)
### Aliases: ndNMF

### ** Examples

dat <- rbind(matrix(c(rep(3, 16), rep(8, 24)), ncol=5),
matrix(c(rep(5, 16), rep(5, 24)), ncol=5),
matrix(c(rep(18, 16), rep(7, 24)), ncol=5)) +
matrix(runif(120,-1,1), ncol=5)
trainlabel <- c(1,1,2,2,2)

res <- ndNMF(dat, trainlabel, r=2, lambada = 0.1)
res$H
res$rnk



