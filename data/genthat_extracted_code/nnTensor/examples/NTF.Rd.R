library(nnTensor)


### Name: NTF
### Title: Non-negative CP Decomposition Algorithms (NTF)
### Aliases: NTF
### Keywords: methods

### ** Examples

tensordata <- toyModel(model = "CP")
out <- NTF(tensordata, rank=3, algorithm="Beta-HALS", num.iter=2)



