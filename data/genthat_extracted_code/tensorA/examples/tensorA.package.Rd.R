library(tensorA)


### Name: tensorA-package
### Title: The tensorA package for tensor arithmetic
### Aliases: tensorA-package tensor Tensor tensorA
### Keywords: package

### ** Examples

A <- to.tensor( 1:20, c(a=2,b=2,c=5) )
A
ftable(A)
B <- to.tensor( c(0,1,1,0) , c(a=2,"a'"=2))
A %e% B
drag.tensor( A , B, c("a","b"))
A %e% one.tensor(c(c=5))/5     # a mean of matrices
reorder.tensor(A,c("c","b","a"))
A -  reorder.tensor(A,c("c","b","a"))  # =0 since sequence is irrelevant
inv.tensor(A,"a",by="c")  




