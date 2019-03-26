library(GPrank)


### Name: getModelKernParams
### Title: Getting the values of the kernel parameters of the GP model
### Aliases: getModelKernParams
### Keywords: parameter

### ** Examples

x=as.matrix(seq(1,10))
y=as.matrix(sin(x))
v=as.matrix(runif(10,0,0.5))
kernelTypes=c("rbf","white","fixedvariance")
model=constructModel(x,y,v,kernelTypes)
params=getModelKernParams(model)




