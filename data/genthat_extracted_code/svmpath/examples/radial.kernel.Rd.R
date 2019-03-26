library(svmpath)


### Name: radial.kernel
### Title: compute the kernel matrix for svmpath
### Aliases: radial.kernel poly.kernel
### Keywords: regression

### ** Examples

data(svmpath)
attach(balanced.overlap)
fit<-svmpath(x,y,kernel=radial.kernel)
detach(2)



