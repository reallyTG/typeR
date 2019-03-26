library(tensorA)


### Name: untensor
### Title: Removes indices/dimensions from a tensor
### Aliases: untensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:64,c(a=2,b=2,c=2,d=2,e=2,f=2))
untensor(A,list(c(1,5),c(2,4)),name=c("i","j"))
untensor(A,by=c("c","f"))
untensor(A,c("a","d"))



