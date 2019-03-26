library(fda.usc)


### Name: inprod.fdata
### Title: Inner products of Functional Data Objects o class (fdata)
### Aliases: inprod.fdata
### Keywords: cluster

### ** Examples


x<-seq(0,2*pi,length=1001)
fx1<-sin(x)/sqrt(pi)
fx2<-cos(x)/sqrt(pi)
argv<-seq(0,2*pi,len=1001)
fdat0<-fdata(rep(0,len=1001),argv,range(argv))
fdat1<-fdata(fx1,x,range(x))
inprod.fdata(fdat1,fdat1)
inprod.fdata(fdat1,fdat1)
metric.lp(fdat1)
metric.lp(fdat1,fdat0)
norm.fdata(fdat1)
# The same
integrate(function(x){(abs(sin(x)/sqrt(pi))^2)},0,2*pi)
integrate(function(x){(abs(cos(x)/sqrt(pi))^2)},0,2*pi)



