library(rTensor)


### Name: tperm-methods
### Title: Mode Permutation for Tensor
### Aliases: tperm tperm,Tensor-method tperm-methods

### ** Examples

tnsr <- rand_tensor(c(3,4,5))
dim(tperm(tnsr,perm=c(2,1,3)))
dim(tperm(tnsr,perm=c(1,3,2)))



