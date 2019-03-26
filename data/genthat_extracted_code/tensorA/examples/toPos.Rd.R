library(tensorA)


### Name: toPos.tensor
### Title: get the position of an index of tensor
### Aliases: toPos.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:30,c(a=2,b=3,c=5))
toPos.tensor(A,c("b","c"))
toPos.tensor(A,c(2,1))     # only returns the values
toPos.tensor(A,c("^a"),both=TRUE)



