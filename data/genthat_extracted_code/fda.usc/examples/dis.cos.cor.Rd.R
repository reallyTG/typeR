library(fda.usc)


### Name: dis.cos.cor
### Title: Proximities between functional data
### Aliases: dis.cos.cor
### Keywords: cluster

### ** Examples

 r1<-rnorm(1001,sd=.01)
 r2<-rnorm(1001,sd=.01)
 x<-seq(0,2*pi,length=1001)
 fx<-fdata(sin(x)/sqrt(pi)+r1,x)
 dis.cos.cor(fx,fx)
 dis.cos.cor(c(fx,fx),as.dis=TRUE)
 fx0<-fdata(rep(0,length(x))+r2,x)
 plot(c(fx,fx0))
 dis.cos.cor(c(fx,fx0),as.dis=TRUE)
 


