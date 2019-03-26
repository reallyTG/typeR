library(FastHCS)


### Name: FHCSkernelEVD
### Title: Carries out the kernelEVD algorithm for data reduction
### Aliases: FHCSkernelEVD
### Keywords: multivariate robust

### ** Examples

n<-50
p<-200
x<-matrix(rnorm(n*p),nc=p)
W<-FHCSkernelEVD(x)



