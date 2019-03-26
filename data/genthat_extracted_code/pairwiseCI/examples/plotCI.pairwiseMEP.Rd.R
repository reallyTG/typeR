library(pairwiseCI)


### Name: plotCI.methods
### Title: Plot confidence intervals
### Aliases: plotCI.pairwiseMEP plotCI.pairwiseCI
### Keywords: hplot

### ** Examples



x1<-rnorm(120,20,2)
x2<-rnorm(120,100,8)
x3<-rpois(120,10)
A<-rep(c("a1","a2","a3"), c(40,40,40))
B<-rep(rep(c("b1","b2"), c(20,20)), times=3)
dat<-data.frame(x1=x1,x2=x2,x3=x3,A=A, B=B)


test<-pairwiseMEP(x=dat, ep=c("x1","x2","x3"),
 f="A", by="B", conf.level=0.9, control="a1",
 method=c("Param.ratio","Param.ratio","Poisson.ratio"))

plotCI(test, whichep=c("x1","x2"), lines=c(0.8,1.25))

plotCI(test, whichep=c(1,2,3))





