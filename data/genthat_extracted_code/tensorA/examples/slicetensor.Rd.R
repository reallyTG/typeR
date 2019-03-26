library(tensorA)


### Name: slice.tensor
### Title: Working with the indices of a tensor (accessing, slicing,
###   renaming, ...)
### Aliases: slice.tensor [[.tensor [.tensor [[<-.tensor [<-.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:20,c(A=2,B=2,C=5))
A[C=1]
A[C=1:3]
A[[B=~b]]                  # renaming dimensions
A[[B=~b,A=~aaa]]      
A[[B=~b,A=~aaa,aaa=1]]      
A[[A=1,B=~gamma]][C=1:2]
A 



