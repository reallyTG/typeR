library(fda.usc)


### Name: Kernel
### Title: Symmetric Smoothing Kernels.
### Aliases: Kernel Ker.norm Ker.cos Ker.epa Ker.tri Ker.tri Ker.quar
###   Ker.unif
### Keywords: kernel

### ** Examples

y=qnorm(seq(.1,.9,len=100))
a<-Kernel(u=y)
b<-Kernel(type.Ker="Ker.tri",u=y)
c=Ker.cos(y)



