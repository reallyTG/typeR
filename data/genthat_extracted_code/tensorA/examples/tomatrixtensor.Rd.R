library(tensorA)


### Name: to.matrix.tensor
### Title: The matrix corresponding to a tensor seen as a linear mapping of
###   tensors.
### Aliases: to.matrix.tensor
### Keywords: arith

### ** Examples

A <- reorder.tensor(to.tensor(1:30,c(a=2,b=3,c=5)),c("c","a","b"))

to.matrix.tensor(A,"a",c("b","c"))              # matrix(1:30,nrow=2)

to.matrix.tensor(A,c("a","b"),c("c"))           # matrix(1:30,nrow=6)

to.matrix.tensor(A,c("a","b"),by=c("c")) # structure(1:30,dim=c(6,1,5)))
to.matrix.tensor(A,c("a"),by=c("c"))     # structure(1:30,dim=c(2,3,5)))



