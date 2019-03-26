library(tensorA)


### Name: bind.tensor
### Title: A cbind/rbind for tensors
### Aliases: bind.tensor
### Keywords: arith

### ** Examples

  A <- to.tensor(1:6,c(a=2,b=3))
bind.tensor(A,"a",A)
bind.tensor(A,"b",A)



