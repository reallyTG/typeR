library(nnTensor)


### Name: NMF
### Title: Non-negative Matrix Factorization Algorithms (NMF)
### Aliases: NMF
### Keywords: methods

### ** Examples

library("fields")
matdata <- toyModel(model = "NMF")
out <- NMF(matdata, J=2, algorithm="Frobenius", num.iter=2)



