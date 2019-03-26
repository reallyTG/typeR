library(tensorA)


### Name: reorder.tensor
### Title: Permutation of indices and storage sequence of a tensor
### Aliases: reorder.tensor
### Keywords: array

### ** Examples

A <- to.tensor(1:20,c(A=2,B=2,C=5))
A
reorder(A,"C")
reorder(A,"B")



