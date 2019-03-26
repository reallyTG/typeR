library(rTensor)


### Name: ttm
### Title: Tensor Times Matrix (m-Mode Product)
### Aliases: ttm

### ** Examples

tnsr <- new("Tensor",3L,c(3L,4L,5L),data=runif(60))
mat <- matrix(runif(50),ncol=5)
ttm(tnsr,mat,m=3)



