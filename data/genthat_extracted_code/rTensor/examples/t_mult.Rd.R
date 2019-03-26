library(rTensor)


### Name: t_mult
### Title: Tensor Multiplication (T-MULT)
### Aliases: t_mult

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
tnsr2 <- new("Tensor",3L,c(4L,3L,5L),data=runif(60))
t_mult(tnsr, tnsr2)



