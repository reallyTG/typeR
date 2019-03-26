library(tensorA)


### Name: level.tensor
### Title: The level (number of indices) of a tensor
### Aliases: level.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:24,c(a=1,b=2,c=3,d=4))
level.tensor(A)
level.tensor(matrix(1))
level.tensor(1:10)
level.tensor(1)



