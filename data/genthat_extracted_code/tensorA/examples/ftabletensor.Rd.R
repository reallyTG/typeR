library(tensorA)


### Name: ftable.tensor
### Title: Pretty printing of tensors
### Aliases: ftable.tensor
### Keywords: math

### ** Examples

A <- to.tensor(1:20,c(U=2,V=2,W=5))
A
dim(A)
names(A)
dimnames(A)

ftable(to.tensor(A))
ftable(to.tensor(c(A),dim(A)))




