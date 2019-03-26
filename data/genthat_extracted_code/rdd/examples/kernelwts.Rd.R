library(rdd)


### Name: kernelwts
### Title: Kernel Weighting function
### Aliases: kernelwts

### ** Examples

require(graphics)

X<-seq(-1,1,.01)
triang.wts<-kernelwts(X,0,1,kernel="triangular")
plot(X,triang.wts,type="l")

cos.wts<-kernelwts(X,0,1,kernel="cosine")
plot(X,cos.wts,type="l")



