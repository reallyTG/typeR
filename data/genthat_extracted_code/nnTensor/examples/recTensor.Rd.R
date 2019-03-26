library(nnTensor)


### Name: recTensor
### Title: Tensor Reconstruction from core tensor (S) and factor matrices
###   (A)
### Aliases: recTensor
### Keywords: methods

### ** Examples

tensordata <- toyModel(model = "CP")
out <- NTF(tensordata, rank=3, algorithm="Beta-HALS", num.iter=2)
rec <- recTensor(out$S, out$A)



