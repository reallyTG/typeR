library(tensorA)


### Name: riemann.tensor
### Title: Tensor multiplication with Riemann's convention
### Aliases: riemann.tensor %r% %r%.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:20,c(U=2,"^V"=2,W=5))
B <- to.tensor(1:20,c("^U"=2,V=2,Q=5))
riemann.tensor(A,B)
A %r% B 




