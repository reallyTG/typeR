library(nnTensor)


### Name: NTD
### Title: Non-negative Tucker Decomposition Algorithms (NTD)
### Aliases: NTD
### Keywords: methods

### ** Examples

tensordata <- toyModel(model = "Tucker")
out <- NTD(tensordata, rank=c(2,2,2), algorithm="Frobenius", init="Random", num.iter=2)



