library(DNMF)


### Name: NMFpval
### Title: P value for discriminant Non-Negative Matrix Factorization
### Aliases: NMFpval

### ** Examples

dat <- rbind(matrix(c(rep(3, 16), rep(8, 24)), ncol=5),
matrix(c(rep(5, 16), rep(5, 24)), ncol=5),
matrix(c(rep(18, 16), rep(7, 24)), ncol=5)) +
matrix(runif(120,-1,1), ncol=5)
trainlabel <- c(1,1,2,2,2)

nmf_res <- ndNMF(dat, trainlabel, r=2, lambada = 0.1)
pMat <- NMFpval(nmf_res, np=10, ncores=2, top=4)



