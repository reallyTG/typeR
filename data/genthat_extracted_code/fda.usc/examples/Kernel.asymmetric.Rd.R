library(fda.usc)


### Name: Kernel.asymmetric
### Title: Asymmetric Smoothing Kernel
### Aliases: AKer.norm AKer.cos AKer.epa AKer.tri AKer.tri AKer.quar
###   AKer.unif Kernel.asymmetric
### Keywords: kernel

### ** Examples

y=qnorm(seq(.1,.9,len=100))
a<-Kernel.asymmetric(u=y)
b<-Kernel.asymmetric(type.Ker="AKer.tri",u=y)
c=AKer.cos(y)



