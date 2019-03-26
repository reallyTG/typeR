library(fda.usc)


### Name: norm.fdata
### Title: Approximates Lp-norm for functional data.
### Aliases: norm.fdata norm.fd
### Keywords: math

### ** Examples



x<-seq(0,2*pi,length=1001)
fx1<-sin(x)/sqrt(pi)
fx2<-cos(x)/sqrt(pi)
argv<-seq(0,2*pi,len=1001)
fdat0<-fdata(rep(0,len=1001),argv,range(argv))
fdat1<-fdata(fx1,x,range(x))
metric.lp(fdat1)
metric.lp(fdat1,fdat0)
norm.fdata(fdat1)
# The same
integrate(function(x){(abs(sin(x)/sqrt(pi))^2)},0,2*pi)
integrate(function(x){(abs(cos(x)/sqrt(pi))^2)},0,2*pi)

bspl1<- create.bspline.basis(c(0,2*pi),21)
fd.bspl1 <- fd(basisobj=bspl1)
fd.bspl2<-fdata2fd(fdat1,nbasis=21)
norm.fd(fd.bspl1)
norm.fd(fd.bspl2)




