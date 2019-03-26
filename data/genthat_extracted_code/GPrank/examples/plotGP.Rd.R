library(GPrank)


### Name: plotGP
### Title: Plotting fitted GP models
### Aliases: plotGP
### Keywords: plot

### ** Examples

x=as.matrix(seq(1,10))
y=as.matrix(sin(x))
v=as.matrix(runif(10,0,0.5))
kernelTypes=c("rbf","white","fixedvariance")
model=constructModel(x,y,v,kernelTypes)
col_item=getColorVector()[1]
ylimits=c(min(y)-0.1,max(y)+0.1)
plotGP(model,col_item,ylimits)




