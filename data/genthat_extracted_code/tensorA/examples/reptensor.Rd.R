library(tensorA)


### Name: reptensor
### Title: Repeats a tensor
### Aliases: rep.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:4,c(A=2,B=2))
rep(A,3)
rep(A,3,3,"u")
rep(A,c(2,3))
A <- to.tensor(1:4,c(A=1,B=4))
rep(A,5,pos="A",name=NA)



