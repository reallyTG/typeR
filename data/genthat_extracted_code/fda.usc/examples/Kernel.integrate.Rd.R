library(fda.usc)


### Name: Kernel.integrate
### Title: Integrate Smoothing Kernels.
### Aliases: Kernel.integrate IKer.norm IKer.cos IKer.epa IKer.tri IKer.tri
###   IKer.quar IKer.unif
### Keywords: kernel

### ** Examples



y=qnorm(seq(.1,.9,len=100))
d=IKer.tri(y)
e=IKer.cos(y)
e2=Kernel.integrate(u=y,Ker=Ker.cos)
e-e2
f=IKer.epa(y)
f2=Kernel.integrate(u=y,Ker=Ker.epa)
f-f2


plot(d,type="l",ylab="Integrate Kernel")
lines(e,col=2,type="l")
lines(f,col=4,type="l")





