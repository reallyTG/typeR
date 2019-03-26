library(rTensor)


### Name: ttl
### Title: Tensor Times List
### Aliases: ttl

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
lizt <- list('mat1' = matrix(runif(30),ncol=3), 
'mat2' = matrix(runif(40),ncol=4),
'mat3' = matrix(runif(50),ncol=5))
ttl(tnsr,lizt,ms=c(1,2,3))



