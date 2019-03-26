library(tensorA)


### Name: margin.tensor
### Title: Marginalization of tensors
### Aliases: margin.tensor
### Keywords: arith

### ** Examples

A <- diag(1:5)
A
margin.tensor(A,1)

A <- to.tensor(1:30,dim=c(i=3,j=5,k=2))
ftable(A)
margin.tensor(A,"j")




