library(PWEALL)


### Name: qpwu
### Title: Piecewise uniform distribution: quantile function
### Aliases: qpwu
### Keywords: piecewise uniform quantiles

### ** Examples

p<-seq(0,1,by=0.1)
u<-c(0.6,0.4)
ut<-c(1,2)
pwuq<-qpwu(p=p,u=u,ut=ut)
pwuq



