library(rTensor)


### Name: t-methods
### Title: Tensor Transpose
### Aliases: t,Tensor-method t-methods

### ** Examples

tnsr <- rand_tensor()
identical(t(tnsr)@data[,,1],t(tnsr@data[,,1]))
identical(t(tnsr)@data[,,2],t(tnsr@data[,,5]))
identical(t(t(tnsr)),tnsr)



