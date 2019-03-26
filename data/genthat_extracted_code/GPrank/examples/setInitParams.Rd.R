library(GPrank)


### Name: setInitParams
### Title: Initializing kernel parameters
### Aliases: setInitParams
### Keywords: initial parameter

### ** Examples

x=as.matrix(seq(1,10))
y=as.matrix(sin(x))
v=as.matrix(runif(10,0,0.5))
kernelTypes=c("rbf","white","fixedvariance")
model=constructModel(x,y,v,kernelTypes)
model=setInitParams(model)




