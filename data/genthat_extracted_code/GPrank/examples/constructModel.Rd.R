library(GPrank)


### Name: constructModel
### Title: Constructing GP model with the specified kernels
### Aliases: constructModel
### Keywords: fixedvariance model

### ** Examples

x=as.matrix(seq(1,10))
y=as.matrix(sin(x))
v=as.matrix(runif(10,0,0.5))
kernelTypes=c("rbf","white","fixedvariance")
model=constructModel(x,y,v,kernelTypes)




